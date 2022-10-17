while true
do
  ping -w 3 1.1.1.1 | grep bytes | grep ' ms$' || logger -p 4 "WARNING: Seems there is no internet" && sleep 300
  sleep 1
done
