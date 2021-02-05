FROM matomo:4.1.1-apache
RUN apt update -y 
RUN apt install -y python3
RUN apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*