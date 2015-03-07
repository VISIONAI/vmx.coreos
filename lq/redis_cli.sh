KEY=$1

REDIS_SERVER=$(etcdctl ls /services/redis | cut -d'/' -f4 | head -n 1)

usage () {
  echo "Wrapper around redis cli which discovers host from etcd"
  echo "Usage:./redis_cli "
  docker run --rm redis redis-cli -h $REDIS_SERVER 
  exit 1
}

[ $# -lt 1 ] && {
  usage
}



docker run --rm redis redis-cli -h $REDIS_SERVER RPUSH vmxlicenses $KEY
