# docker-alpine-nginx-php7
A docker image, include nginx &amp; php7, base alpine

# usage
<pre>
<code>
rong@debian:/home/docker$ git clone https://github.com/caoxiaolin/docker-alpine-nginx-php7.git ./
正克隆到 '.'...
remote: Counting objects: 19, done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 19 (delta 0), reused 13 (delta 0), pack-reused 0
展开对象中: 100% (19/19), 完成.
检查连接... 完成。
rong@debian:/home/docker$ ls
build-docker  config  Dockerfile  LICENSE  README.md  run-docker  www
rong@debian:/home/docker$ mkdir -p logs/nginx logs/php
rong@debian:/home/docker$ ./build-docker 
Sending build context to Docker daemon  88.58kB
Step 1/6 : FROM alpine
 ---> 3fd9065eaf02
Step 2/6 : MAINTAINER caoxiaolin
 ---> Running in 6a2a58740ad2
 ---> 3c072d78e8ce
Removing intermediate container 6a2a58740ad2
Step 3/6 : RUN mkdir -p /run/nginx/ /var/log/supervisord /etc/supervisord     && apk add --update supervisor nginx nginx-mod-http-lua php7 php7-fpm php7-mysqli php7-pdo_mysql php7-mbstring php7-json php7-zlib php7-gd php7-curl php7-session php7-opcache php7-redis php7-mcrypt     && rm -rf /var/cache/apk/* /tmp/*     && chown nginx:nginx /run/nginx/
 ---> Running in 2cc89a929546
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
(1/57) Installing pcre (8.41-r1)
(2/57) Installing nginx (1.12.2-r3)
Executing nginx-1.12.2-r3.pre-install
(3/57) Installing nginx-mod-devel-kit (1.12.2-r3)
(4/57) Installing libgcc (6.4.0-r5)
(5/57) Installing luajit (2.1.0_beta3-r0)
(6/57) Installing nginx-mod-http-lua (1.12.2-r3)
(7/57) Installing php7-common (7.1.12-r0)
(8/57) Installing ncurses-terminfo-base (6.0_p20171125-r0)
(9/57) Installing ncurses-terminfo (6.0_p20171125-r0)
(10/57) Installing ncurses-libs (6.0_p20171125-r0)
(11/57) Installing libedit (20170329.3.1-r3)
(12/57) Installing libxml2 (2.9.7-r0)
(13/57) Installing php7 (7.1.12-r0)
(14/57) Installing ca-certificates (20171114-r0)
(15/57) Installing libssh2 (1.8.0-r2)
(16/57) Installing libcurl (7.57.0-r0)
(17/57) Installing php7-curl (7.1.12-r0)
(18/57) Installing php7-fpm (7.1.12-r0)
(19/57) Installing libxau (1.0.8-r2)
(20/57) Installing libbsd (0.8.6-r1)
(21/57) Installing libxdmcp (1.1.2-r4)
(22/57) Installing libxcb (1.12-r1)
(23/57) Installing libx11 (1.6.5-r1)
(24/57) Installing libxext (1.3.3-r2)
(25/57) Installing libice (1.0.9-r2)
(26/57) Installing libuuid (2.31-r0)
(27/57) Installing libsm (1.2.2-r1)
(28/57) Installing libxt (1.1.5-r1)
(29/57) Installing libxpm (3.5.12-r0)
(30/57) Installing libbz2 (1.0.6-r6)
(31/57) Installing libpng (1.6.34-r1)
(32/57) Installing freetype (2.8.1-r2)
(33/57) Installing libjpeg-turbo (1.5.2-r0)
(34/57) Installing libwebp (0.6.0-r1)
(35/57) Installing php7-gd (7.1.12-r0)
(36/57) Installing php7-json (7.1.12-r0)
(37/57) Installing php7-mbstring (7.1.12-r0)
(38/57) Installing libmcrypt (2.5.8-r7)
(39/57) Installing php7-mcrypt (7.1.12-r0)
(40/57) Installing php7-openssl (7.1.12-r0)
(41/57) Installing php7-mysqlnd (7.1.12-r0)
(42/57) Installing php7-mysqli (7.1.12-r0)
(43/57) Installing php7-opcache (7.1.12-r0)
(44/57) Installing php7-pdo (7.1.12-r0)
(45/57) Installing php7-pdo_mysql (7.1.12-r0)
(46/57) Installing php7-session (7.1.12-r0)
(47/57) Installing php7-redis (3.1.4-r0)
(48/57) Installing php7-zlib (7.1.12-r0)
(49/57) Installing expat (2.2.5-r0)
(50/57) Installing libffi (3.2.1-r4)
(51/57) Installing gdbm (1.13-r1)
(52/57) Installing readline (7.0.003-r0)
(53/57) Installing sqlite-libs (3.21.0-r0)
(54/57) Installing python2 (2.7.14-r2)
(55/57) Installing py-meld3 (1.0.2-r1)
(56/57) Installing py-setuptools (33.1.1-r1)
(57/57) Installing supervisor (3.3.3-r1)
Executing busybox-1.27.2-r7.trigger
Executing ca-certificates-20171114-r0.trigger
OK: 83 MiB in 68 packages
 ---> 7d6e83d4ebe0
Removing intermediate container 2cc89a929546
Step 4/6 : ADD config/supervisord.conf /etc/supervisord.conf
 ---> 782684aa4629
Step 5/6 : EXPOSE 80 443
 ---> Running in 3ffdea5f9ffd
 ---> e3489c9c00bc
Removing intermediate container 3ffdea5f9ffd
Step 6/6 : CMD /usr/bin/supervisord -n -c /etc/supervisord.conf
 ---> Running in 7d126a7c0a81
 ---> b56d6aef2782
Removing intermediate container 7d126a7c0a81
Successfully built b56d6aef2782
Successfully tagged webserver:latest
rong@debian:/home/docker$ ./run-docker 
6fed6c317b9eab204143a59fd9b17aedec3bddd60f6e866073cfdf5934fa734f
rong@debian:/home/docker$ tail -f logs/nginx/*
==> logs/nginx/access.log <==
192.168.41.1 - - [01/Feb/2018:08:22:44 +0000] "GET / HTTP/1.1" 200 84312 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0" "-"

==> logs/nginx/error.log <==
</code>
</pre>
