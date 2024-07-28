FROM centos:latest
RUN yum install httpd zip unzip -yum
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/brainwave.zip /var/www/html
WORKDIR /var/www/html
RUN unzip brainwave.zip 
RUN rm -rf brainwave.zip &&\
    cp -rf brainwave/* . &&\
	rm -rf brainwave
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
