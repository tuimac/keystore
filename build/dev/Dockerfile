FROM alpine:latest

WORKDIR /root

ADD entrypoint.sh /root/entrypoint.sh
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 8080

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git bash vim curl ncurses tree npm nodejs openjdk11 nginx && \
    mkdir /etc/vim/backup && \
    mkdir /etc/vim/undo && \
    rm /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/vim/vimrc -o /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/linux/bashrc/.bashrc_node_docker -o /root/.bashrc  && \
    git clone https://github.com/tuimac/keystore && \
    cd /root/keystore/src/frontend && \
    npm install && \
    git config --global user.email "tuimac.devadm01@gmail.com" && \
    git config --global user.name "tuimac"

ENTRYPOINT ["/root/entrypoint.sh"]
