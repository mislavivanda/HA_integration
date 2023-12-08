#https://developers.home-assistant.io/docs/add-ons/configuration/#build-args
ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
  apk --no-cache add \
  nginx \
  \
  && mkdir -p /run/nginx

COPY ingress.conf /etc/nginx/http.d/
COPY . /build

CMD [ "nginx","-g","daemon off;error_log /dev/stdout debug;" ]