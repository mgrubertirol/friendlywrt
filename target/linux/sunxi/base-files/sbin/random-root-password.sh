#!/bin/sh
#set -ex

PATH=/sbin:$PATH

CLEARPASS=`dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev`
SALT=`dd if=/dev/urandom bs=1 count=3 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev`
PASS=`openssl passwd -1 -salt $SALT $CLEARPASS`
sed -i "s~^\(root:\)[^:]*\(:.*\)$~\1${PASS}\2~" /etc/shadow
echo "root password is: $CLEARPASS"

