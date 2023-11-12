FROM n8nio/n8n

USER root

RUN apk update && apk add --no-cache sudo docker-cli && rm -rf /var/cache/apk/* && echo "node ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/node
RUN sed -i "s|isFeatureEnabled(feature) {|isFeatureEnabled(feature) { return !!process.env['N8N_' + feature.replace(':', '_').toUpperCase() + '_ENABLE'];|" /usr/local/lib/node_modules/n8n/dist/License.js

USER node
