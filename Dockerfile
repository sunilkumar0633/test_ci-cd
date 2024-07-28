FROM centos:latest
RUN yum install httpd zip unzip -yum
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page290/brainwave.zip
RUN unzip brainwave.zip
RUN rm -rf brainwave.zip &&\
    cp -rf brainwave/* . &&\
        rm -rf brainwave
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
