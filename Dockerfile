FROM matomo:4.1.1-apache
RUN apt update -y 
RUN apt install -y python3 cron \
	&& update-rc.d cron defaults enable \
	&& echo "*/5 * * * * grep default-traefik-web-ui- /tmp/from_traefik/*.log > /tmp/matomo.log && cd /var/www/html/misc/log-analytics && python3 import_logs.py --url https://matomo.tferdinand.net --idsite 1 /tmp/matomo.log" >> /var/spool/cron/crontabs/root
RUN mkdir /tmp/from_traefik


RUN apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*
