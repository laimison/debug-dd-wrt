while true
do
  cat /sys/class/thermal/thermal_zone*/temp | awk '{ if($1 > 70000) print $0;}' | grep [0-9] && logger -p 4 "WARNING: temperature is higher than 70 C - `cat /sys/class/thermal/thermal_zone*/temp`" && sleep 300
  sleep 10
done
