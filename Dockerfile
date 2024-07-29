FROM centos:latest

RUN rm -f /etc/yum.repos.d/*

WORKDIR /etc/yum.repos.d

COPY ./local.repo /etc/yum.repos.d/

RUN yum install -y httpd zip wget

WORKDIR /var/www/html

RUN https://www.free-css.com/assets/files/free-css-templates/download/page290/wave-cafe.zip

RUN unzip wave-cafe.zip

RUN rm -f wave-cafe.zip &&\
    cp -rf 2121_wave_cafe/* . &&\
        rm -rf 2121_wave_cafe
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
