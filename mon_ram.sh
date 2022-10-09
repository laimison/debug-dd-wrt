while true
do
  free -mP | grep ^Mem | awk '{print $4}' | awk '{ if($1 < 100000) print $0;}' && logger -p 4 "WARNING: less than 100M of RAM is free - `free -m`" && sleep 300
  sleep 1
done
