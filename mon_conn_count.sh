while true
do
  cat /proc/net/nf_conntrack | wc -l | awk '{ if($1 > 2000) print $0;}' | grep [0-9] && logger -p 4 "WARNING: More than 2000 connections detected - `cat /proc/net/nf_conntrack | tail -n 5`" && sleep 300
  sleep 10
done
