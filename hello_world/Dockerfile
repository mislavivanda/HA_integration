# FROM nginx:alpine
# COPY . /usr/share/nginx/html
ARG BUILD_FROM
FROM $BUILD_FROM
# Install requirements for add-on
#Add nginx and create the run folder for nginx.
RUN \
  apk --no-cache add \
  nginx \
  \
  && mkdir -p /run/nginx

COPY ingress.conf /etc/nginx/http.d/

COPY . /build

#Launch nginx with debug options.
CMD [ "nginx","-g","daemon off;error_log /dev/stdout debug;" ]