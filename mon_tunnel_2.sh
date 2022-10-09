while true
do
  ip=`nvram get oet1_ip1`
  ping -w 60 $ip | grep bytes | grep ' ms$' || logger -p 4 "WARNING: Tunnel $ip is not working - `wg | grep -A 2 $ip | tail -n 2`" && sleep 120
  sleep 1
done
