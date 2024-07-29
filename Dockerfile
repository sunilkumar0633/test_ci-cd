FROM centos:latest
RUN rm -f /etc/yum.repo.d/*
COPY ./local.repo /etc/yum.repo.d/local.repo
RUN yum install httpd zip vim wget -y
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page290/brainwave.zip
RUN unzip brainwave.zip
RUN rm -rf brainwave.zip &&\
    cp -rf brainwave/* . &&\
        rm -rf brainwave
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
