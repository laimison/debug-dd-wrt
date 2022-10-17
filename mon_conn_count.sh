while true
do
  cat /proc/net/nf_conntrack | wc -l | awk '{ if($1 > 2000) print $0;}' | grep [0-9] && logger -p 4 "WARNING: More than 2000 connections detected - Total `cat /proc/net/nf_conntrack | wc -l` | ESTABLISHED `cat /proc/net/nf_conntrack | grep ESTABLISHED | wc -l` | CLOSE `cat /proc/net/nf_conntrack | grep CLOSE | wc -l` | TIME_WAIT `cat /proc/net/nf_conntrack | grep TIME_WAIT | wc -l` | Others `cat /proc/net/nf_conntrack | grep -vE '(ESTABLISHED|CLOSE|TIME_WAIT)' | wc -l`" && sleep 300
  sleep 10
done
