while true
do
  ip=`nvram get oet1_ip0`
  ping -w 60 $ip | grep bytes | grep ' ms$' || (mkdir -p /tmp/ram_disk; tcpdump -i any -n -W 1 -G 10 -tttt -w /tmp/ram_disk/tcpdump_1.cap; sleep 300)
  sleep 1
done
