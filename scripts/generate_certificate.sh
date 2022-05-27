address=$1
if [ -z "$address" ] ; then
    echo "Address is required"
    exit 1
fi

dir=ssl
rm -rf $dir
mkdir $dir

openssl req -x509 -nodes -newkey rsa:4096 -keyout $dir/chattermatter.key -out $dir/chattermatter.crt -subj "/C=PL/O=Pro Dev Team/OU=Oliva/CN=$address"
