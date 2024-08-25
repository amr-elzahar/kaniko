FROM ubuntu:latest

WORKDIR /app

COPY index.html .

RUN apt update \
   && apt install nginx --yes \ 
   && rm -f /var/www/html/*.html \
   && cp index.html /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]