FROM alpine:latest

WORKDIR /root

ADD entrypoint.sh /root/entrypoint.sh

EXPOSE 80

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git bash vim curl icu-dev icu-libs ncurses tree nodejs npm openjdk11 && \
    mkdir /etc/vim/backup && \
    mkdir /etc/vim/undo && \
    rm /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/vim/vimrc -o /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/linux/bashrc/.bashrc_aws -o /root/.bashrc && \
    git clone https://github.com/tuimac/keystore && \
    npm install -g @angular/cli && \
    cd /root/keystore/src/frontend && \
    npm install && \
    git config --global user.email "tuimac.devadm01@gmail.com" && \
    git config --global user.name "tuimac"

ENTRYPOINT ["/root/entrypoint.sh"]
