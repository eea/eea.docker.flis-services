FROM nginx

RUN mkdir -p /app/public
COPY config/nginx.conf /etc/nginx/conf.d/default.conf
COPY config/run.sh /run.sh

CMD ["./run.sh"]
