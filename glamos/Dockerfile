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
# *PRETHODNE NAREDBE ZAKOMENTIRANE TE JE NJIHOVA ULOGA ZAMIJENJENA SA nginx conf OPCIJAMA S OVOG LINKA -> https://github.com/linuxserver/docker-letsencrypt/issues/67#issuecomment-382715473 
# *LOGIKA SLJEDECIH KODOVA:
# *DEFAULTNI USER UNUTAR Dockerfile I run.sh JE root
# *PROBLEM SE JAVLJA JER nginx KREIRA nginx OWNERA I ZA /var/lib/nginx POSTAVLJA nginx USERA A NE ROOTA

# *IZBJEGAVAMO mkdir GRESKU SA PERMISION DENIED KOJA SE DOGADA KOD POKRETANJA nginx SERVERA NA NACIN DA MI SAMI UNAPRIJED NAPRAVIMO ZADANE FOLDERE I SA chown PREBACIMO PRAVA SA nginx NA root USERA I POSTAVIMO PRAVA NAD TIM PROBLEMATICNIM DIREKTORIJIMA
# RUN mkdir -p /var/lib/nginx/tmp/client_body /var/lib/nginx/tmp/proxy /var/lib/nginx/tmp/fastcgi /var/lib/nginx/tmp/uwsgi /var/lib/nginx/tmp/scgi /var/lib/nginx/logs /var/log/nginx \
#   && chown -R root:root /var/lib/nginx /var/lib/nginx/logs /var/log/nginx \
#   && chmod -R 775 /var/lib/nginx /var/lib/nginx/logs /var/log/nginx

#! /var/lib/nginx/logs JE ZAPRAVO POKAZIVAC NA /var/log/nginx DIREKTORIJ
# *PREBACIT PRAVA NAZAD NA nginx ZA ZADANI DIREKTORIJ KAKO NGINX KOD KOKRETANJA NE BI JAVLJA GRESKU JER ON KAO nginx USER NEMA PRISTUP NEGO root
# *ISTA LOGIKA IDE I ZA /run/nginx ALI TO RJESAVAMO NA DRUKCIJI NACIN BEZ chown -> POSTAVIMO SAMO 777 SA chmod CIME DAJEMO SVIMA SVA PRAVA -> MOZDA BI TO MOGLO ZAMIJENITI SVE OSTALE chown + chmod NAREDBE
# TODO -> REFAKTOR BEZ KORISTENJA chown + OSTAVI KREIRANJE DIREKTORIJA KAO STA JE SAD
# RUN chown -R nginx:nginx /var/lib/nginx/tmp \
#   && chmod -R 775 /var/lib/nginx/tmp
# RUN chmod -R 777 /run/nginx
# CMD [ "nginx","-g","daemon off;" ]
CMD /run.sh