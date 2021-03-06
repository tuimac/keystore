FROM alpine:latest

WORKDIR /root

ADD entrypoint.sh /root/entrypoint.sh
ADD nginx.conf /etc/nginx/nginx.conf
ADD requirements.txt /root/requirements.txt

EXPOSE 80
EXPOSE 8000

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git bash vim curl ncurses tree npm nodejs python3 python3-dev py3-pip nginx postgresql-client postgresql-dev gcc musl-dev && \
    pip3 install -r requirements.txt && \
    mkdir /etc/vim/backup && \
    mkdir /etc/vim/undo && \
    rm /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/vim/vimrc -o /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/linux/bashrc/.bashrc_node_docker -o /root/.bashrc  && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/git/setup.sh -o /root/setup.sh && \
    chmod +x setup.sh && \
    git clone https://github.com/tuimac/keystore && \
    cd /root/keystore/src/frontend && \
    npm install && \
    npm install -g @angular/cli && \
    git config --global user.email "tuimac.devadm01@gmail.com" && \
    git config --global user.name "tuimac" && \
    mkdir -p keystore/.git/hooks && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/git/hook/keystore/pre-commit -o keystore/.git/hooks/pre-commit && \
    chmod +x keystore/.git/hooks/pre-commit

ENTRYPOINT ["/root/entrypoint.sh"]
