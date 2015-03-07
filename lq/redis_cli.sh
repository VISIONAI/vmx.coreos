REDIS_SERVER=$(etcdctl ls /services/redis | cut -d'/' -f4 | head -n 1)

docker run --rm redis redis-cli -h $REDIS_SERVER "$@"
