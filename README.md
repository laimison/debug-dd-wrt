# Debug DD-WRT

Repository contains methods to investigate sudden reboots, networking issues, resourcing issues etc.

## Enable remote logging

### Remote logging client (DD-WRT)

```
nvram set klogd_enable=1
nvram set syslogd_rem_ip=192.168.240.110
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

`sh /tmp/mon_ram.sh &` - writes warning in system log once less than 100M RAM left

`sh /tmp/mon_temp.sh &` - writes warning in system log once any sensore temperature is above 70 C

`sh /tmp/mon_loadavg.sh &` - writes warning in system log once CPU load average is 1 or above

`sh /tmp/mon_conn_count.sh &` - writes warning in system log once TCP connection count is more than 2000

`sh /tmp/mon_routes_anomaly.sh &` - write warning in system log once changes in routes detected

`sh /tmp/mon_tunnel_1.sh &` - writes warning in system log once first WG tunnel is down

`sh /tmp/mon_tunnel_2.sh &` - writes warning in system log once second WG tunnel is down
