FROM n8nio/n8n

USER root

RUN apk update && apk add --no-cache sudo docker-cli && rm -rf /var/cache/apk/* && echo "node ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/node

USER node