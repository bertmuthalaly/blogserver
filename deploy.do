# maybe we want this to be redo-ifchange blogserver-stamp?
# where blogserver-stamp is checksumming the remote blogserver binary

GOOS=linux GOARCH=amd64 go build -o blogserver.amd64
scp blogserver.amd64 root@blogserver:/tmp/blogserver.tmp && \
ssh root@blogserver "mv /tmp/blogserver.tmp /blog/blogserver && \
                 systemctl restart blogserver.service"
