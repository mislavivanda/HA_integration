# FROM nginx:alpine
# COPY . /usr/share/nginx/html
ARG BUILD_FROM
FROM $BUILD_FROM
# Install requirements for add-on
RUN \
  apk add --no-cache \
  python3

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /app

COPY index.html /app
COPY favicon.ico /app
COPY /static /app/static

CMD ["python3", "-m", "http.server", "8000"]