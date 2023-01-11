FROM alpine:latest

ENV PJT_NAME=keystore
ENV WORK_DIR=/root

WORKDIR $WORK_DIR

ADD entrypoint.sh /root/entrypoint.sh
ADD nginx.conf /etc/nginx/nginx.conf
ADD requirements.txt /root/requirements.txt
ADD gunicorn.conf.py /etc/gunicorn/gunicorn.conf.py

EXPOSE 80
EXPOSE 8000

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git bash tzdata curl ncurses tree npm nodejs python3 python3-dev py3-pip nginx postgresql-client postgresql-dev gcc musl-dev && \
    apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/v3.13/main vim~=8.2.4836-r0 && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata && \
    pip3 install -r requirements.txt && \
    mkdir /etc/vim/backup && \
    mkdir /etc/vim/undo && \
    rm /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/vim/vimrc -o /etc/vim/vimrc && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/linux/bashrc/.bashrc_node_docker -o /root/.bashrc  && \
    curl -L https://raw.githubusercontent.com/tuimac/tools/master/git/setup.sh -o /root/setup.sh && \
    chmod +x setup.sh && \
    mkdir /var/log/gunicorn && \
    touch /var/log/gunicorn/access.log && \
    touch /var/log/gunicorn/error.log && \
    mkdir /var/log/${PJT_NAME} && \
    touch /var/log/${PJT_NAME}/main.log && \
    git clone https://github.com/tuimac/${PJT_NAME} && \
    cd ${WORK_DIR}/${PJT_NAME}/src/frontend && \
    npm install -g @angular/cli && \
    npm ci

ENTRYPOINT /root/entrypoint.sh ${PJT_NAME} ${WORK_DIR}
