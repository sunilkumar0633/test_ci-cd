FROM centos:latest
CMD rm -f /etc/yum.repo.d/*
COPY ./local.repo /etc/yum.repo.d/local.repo
CMD yum install httpd zip vim wget -y
WORKDIR /var/www/html
CMD wget https://www.free-css.com/assets/files/free-css-templates/download/page290/brainwave.zip
CMD unzip brainwave.zip
CMD rm -rf brainwave.zip &&\
    cp -rf brainwave/* . &&\
        rm -rf brainwave
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
