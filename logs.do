ssh root@blogserver "DATE=$(date +%m-%d-%Y); journalctl -u blogserver.service -o cat --no-pager > /tmp/$DATE.logs; ln -s -f /tmp/$DATE.logs /tmp/latest-logs"
scp root@blogserver:/tmp/latest-logs $3
