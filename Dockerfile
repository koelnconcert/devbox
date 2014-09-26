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
RUN apt-get update -y && apt-get install -y \
    curl \
    git \
    man-db \
    vim \
    wget

## base config
RUN echo "ALL	ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

## German configuration
# RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
# RUN locale-gen de_DE.UTF-8
# ENV LC_ALL de_DE.UTF-8

## create dev user
RUN useradd -m dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev
