## example Dockerfile for a basic devbox
##
## features
##
## * ubuntu based
## * user is 'dev'
## * full sudo rights
## * some basic package installed
##
## please adjust to your needs

FROM ubuntu:14.04
MAINTAINER Sebastian Peters <koelnconcert@googlemail.com>

## install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y man-db

## base config
RUN echo "ALL	ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

## German configuration
# RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
# RUN locale-gen de_DE.UTF-8
# ENV LC_ALL de_DE.UTF-8

## create dev user
RUN useradd dev
RUN mkdir /home/dev
RUN chown -R dev: /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev
