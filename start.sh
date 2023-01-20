#!/bin/bash 

if [ -z "$HOSTNAME" ]; then
  echo "HOSTNAME env var is not set"
  exit 1;
fi

if [ -z "$PRIME_USER" ]; then
  echo "PRIME_USER env var is not set"
  exit 1;
fi

if [ -z "$WORK_PREFERENCE" ]; then
  echo "WORK_PREFERENCE env var is not set"
  exit 1;
fi

[ -f "/opt/prime95/prime.txt" ] || { cat <<-EOF > /opt/prime95/prime.txt
V24OptionsConverted=1
WGUID_version=2
StressTester=0
UsePrimenet=1
DialUp=0
V5UserID=$PRIME_USER
DiskWriteTime=15
NetworkRetryTime=5
NetworkRetryTime2=25
[PrimeNet]
Debug=0
ProxyHost=
[Worker #1]
WorkPreference=$WORK_PREFERENCE
EOF
}

chmod a+rw /opt/prime95/prime.txt

[ -f "/opt/prime95/local.txt" ] || { cat <<-EOF > /opt/prime95/local.txt
ComputerID=$HOSTNAME
EOF
}

chmod a+rw /opt/prime95/local.txt

/opt/mprime/mprime -d -w/opt/prime95
