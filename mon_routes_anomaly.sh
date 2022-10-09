ip r | md5sum > /tmp/mon_routes_anomaly
while true
do
  cat /tmp/mon_routes_anomaly | grep `ip r | md5sum` || (logger -p 4 "WARNING: Difference in routes detected - `ip r`"; sleep 300)
  sleep 10
  ip r | md5sum > /tmp/mon_routes_anomaly
done
