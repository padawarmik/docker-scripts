FROM nginx:latest
RUN rm /usr/share/nginx/html/*
RUN rm /etc/nginx/conf.d/*
COPY default.conf /etc/nginx/conf.d
COPY zsh /usr/share/nginx/html
EXPOSE 80