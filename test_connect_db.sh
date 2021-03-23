#!/bin/bash
. /etc/openvpn/script/config.sh
##Test Authentication
username=$1
password=$2
user_id=$(mysql -h$HOST -P$PORT -u$USER -p$PASS $DB -sN -e "select login from users where login = '$username' AND password = '$password'")
##Check user
[ "$user_id" != '' ] && [ "$user_id" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
