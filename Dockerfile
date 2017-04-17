FROM ubuntu:latest

MAINTAINER farmerx "farmerx@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

#RUN echo "deb http://mirrors.163.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y vim wget curl openssh-server
RUN mkdir /var/run/sshd

# 将sshd的UsePAM参数设置成no
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN echo "root:123456" | chpasswd

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
