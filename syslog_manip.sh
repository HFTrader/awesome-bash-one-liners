# Prints out source and port of rejected (iptables) connection packets
cat /var/log/syslog | grep SYN | sed -n 's/.*DST=\([0-9\.]*\).*DPT=\([0-9]*\).*/\1 \2/p' 

# Prints unique lists of CIDR for rejected firewall ports (good for whitelisting)
cat /var/log/syslog | grep SYN | sed -n 's/.*DST=\([0-9\.]*\).*DPT=\([0-9]*\).*/\1 \2/p' | sort | uniq | ( while read ip port; do cidr=`whois $ip | grep CIDR`; name=`whois $ip|grep NetName`; echo $cidr $port $name; done ) | sort | uniq



