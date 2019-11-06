FROM jenkins/jnlp-slave:alpine
LABEL maintainer="monicashinde3@gmail.com"
USER root
RUN apk add --update docker openrc
RUN rc-update add docker boot
# Standard SSH port
RUN adduser -S jenkins  &&\
    chown -R jenkins:jenkins /home/jenkins &&\
    usermod -aG sudo jenkins &&\
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 22