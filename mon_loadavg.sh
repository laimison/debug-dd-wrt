while true
do
  cat /proc/loadavg | tr ' ' '\n' | head -n 3 | awk '{ if($1 > 1.99) print $0;}' | grep [0-9] && logger -p 4 "WARNING: CPU load average is 2.0 or higher - `top -n 1 -b`" && sleep 300
  sleep 10
done
