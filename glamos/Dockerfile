#https://developers.home-assistant.io/docs/add-ons/configuration/#build-args
ARG BUILD_FROM
FROM $BUILD_FROM
# USER root

RUN \
  apk --no-cache add \
  nginx \
  \
  && mkdir -p /run/nginx

# RUN apk add --no-cache su-exec
# RUN apk add --no-cache dmidecode
# RUN apk add --no-cache lshw

COPY ingress.conf /etc/nginx/http.d/
COPY . /build
COPY run.sh /
RUN chmod a+x /run.sh
# RUN chmod 0775 /var/lib/nginx
# RUN chmod 0775 /var/lib/nginx/tmp
# RUN mkdir -p /var/lib/nginx/tmp/client_body /var/lib/nginx/logs /var/log/nginx \
#   && chown -R root:root /var/lib/nginx /var/lib/nginx/tmp/client_body /var/lib/nginx/logs /var/log/nginx \
#   && chmod -R 775 /var/lib/nginx /var/lib/nginx/tmp/client_body /var/lib/nginx/logs /var/log/nginx

RUN mkdir -p /var/lib/nginx/tmp/client_body /var/lib/nginx/tmp/proxy /var/lib/nginx/logs /var/log/nginx \
  && chown -R root:root /var/lib/nginx /var/lib/nginx/logs /var/log/nginx \
  && chmod -R 775 /var/lib/nginx /var/lib/nginx/logs /var/log/nginx

RUN chown -R nginx:nginx /var/lib/nginx/tmp \
  && chmod -R 775 /var/lib/nginx/tmp
# CMD [ "nginx","-g","daemon off;" ]
CMD /run.sh