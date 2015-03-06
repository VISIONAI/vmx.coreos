usage () {
  echo "Add a valid key to the license queue"
  echo "Usage:./add_key LICENSEKEY_UUID"
  exit 1
}

[ $# -lt 1 ] && {
  usage
}

KEY=$1

docker  pull redis
docker run --rm redis redis-cli RPUSH vmxlicenses $KEY
