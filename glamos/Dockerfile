#https://developers.home-assistant.io/docs/add-ons/configuration/#build-args
ARG BUILD_FROM
FROM $BUILD_FROM

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

CMD [ "nginx","-g","daemon off;error_log /dev/stdout debug;" ]
# CMD /run.sh