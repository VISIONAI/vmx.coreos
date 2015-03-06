usage () {
  echo "Add a valid key to the license queue"
  echo "Usage:./add_key LICENSEKEY_UUID"
  exit 1
}

[ $# -lt 1 ] && {
  usage
}

KEY=$1

REDIS_SERVER=$(etcdctl ls /services/redis | head -n 1)

docker  pull redis
docker run --rm redis redis-cli -h $REDIS_SERVER RPUSH vmxlicenses $KEY
