# Debug DD-WRT

Repository contains methods to investigate sudden reboots, networking issues, resourcing issues etc ....

## Enable remote logging

### Remote logging client (DD-WRT)

```
nvram set syslogd_rem_ip=192.168.240.110
nvram set klogd_enable=1
```

### Remote logging server

```
docker-compose up

cd data/log
sudo touch messages messages-kv.log
sudo chown era:era messages messages-kv.log
chmod 775 messages messages-kv.log
```

## Monitoring

These scripts can be started to watch system and write warning in `/var/log/messages` (log line is also sent to remote server).
So it's useful to collect some details before crash, during networking issue, etc

```
sh /jffs/mon_ram.sh &    # writes warning in system log once less than 100M RAM left

sh /jffs/mon_temp.sh &    # writes warning in system log once any sensore temperature is above 70 C

sh /jffs/mon_loadavg.sh &    # writes warning in system log once CPU load average is 1 or above

sh /jffs/mon_conn_count.sh &    # writes warning in system log once TCP connection count is more than 2000

sh /jffs/mon_internet.sh &    # writes warning in system log once internet is not reachable

sh /jffs/mon_routes_anomaly.sh &    # writes warning in system log once changes in routes detected

sh /jffs/mon_tunnel_1.sh &    # writes warning in system log once first WG tunnel is down

sh /jffs/mon_tunnel_2.sh &    # writes warning in system log once second WG tunnel is down

sh /jffs/mon_tunnel_tcpdump_1.sh &    # writes tcpdump to file once first WG tunnel is down

sh /jffs/mon_tunnel_tcpdump_2.sh &    # writes tcpdump to file once second WG tunnel is down

```
