FROM n8nio/n8n

USER root

# 挂载 docker 命令
RUN apk update && apk add --no-cache sudo docker-cli && rm -rf /var/cache/apk/* && echo "node ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/node

# Hack features
RUN sed -i "s|isFeatureEnabled(feature) {|isFeatureEnabled(feature) { return !!process.env['N8N_' + feature.replace(':', '_').toUpperCase() + '_ENABLE'];|" /usr/local/lib/node_modules/n8n/dist/License.js

# 安装需要的外部库
RUN cd /usr/local/lib/node_modules/n8n && npm install file-type@16.5.4

USER node
