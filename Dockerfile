FROM rockylinux:8.5

MAINTAINER Suhui, <suhui@kokona.tech>


RUN DEBIAN_FRONTEND=noninteractive yum install wget sudo git nmap net-tools curl gnupg -y \
&& curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - 


RUN yum install nodejs npm \
&& npm install -g web3.storage



RUN wget "https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64" && mv ttyd.x86_64 /usr/bin/ttyd && chmod +x /usr/bin/ttyd



WORKDIR /root
ENV LANG=zh_CN.UTF-8
EXPOSE 8080

CMD ["sh", "-c", "/usr/bin/ttyd -c ${USERNAME:-user}:${PASSWORD:-password} -p ${PORT:-8080} bash"]
