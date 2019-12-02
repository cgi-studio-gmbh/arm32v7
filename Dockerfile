FROM  ubuntu:18.04

MAINTAINER Abdallah Huballah (ah@cgi-studio.com)

RUN dpkg --add-architecture armhf

RUN mv /etc/apt/sources.list  /etc/apt/sources.list.bak

COPY ./apt/sources.list /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --allow-remove-essential apt-utils:armhf vim git-core wget g++-8-arm-linux-gnueabihf curl:armhf pkg-config:armhf apt-transport-https:armhf \
    libglew-dev:armhf libpng-dev:armhf libasound2-dev:armhf \
    libxinerama-dev:armhf libxcursor-dev:armhf libxi-dev:armhf libxrandr-dev:armhf \
    libnss3-dev:armhf libfontconfig1-dev:armhf libfreetype6-dev:armhf libcairo2-dev:armhf \
    libpango1.0-0:armhf libxcomposite1:armhf libcups2-dev:armhf libdbus-1-3:armhf libgconf-2-4:armhf \
    libx11-6:armhf libgdk-pixbuf2.0-0:armhf libxdamage1:armhf libxext6:armhf libxi6:armhf libxrender1:armhf libnspr4:armhf \
    libglib2.0-0:armhf libgtk2.0-0:armhf libxfixes3:armhf libxi6:armhf \
    libxtst6:armhf libxss1:armhf \ 
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/arm-linux-gnueabihf-g++-8 /usr/bin/arm-linux-gnueabihf-g++
RUN ln -s /usr/bin/arm-linux-gnueabihf-gcc-8 /usr/bin/arm-linux-gnueabihf-gcc

RUN wget https://cmake.org/files/v3.14/cmake-3.14.3-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh cmake-3.14.3-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake

RUN mkdir -p /home/code/CGI

WORKDIR /home/code/CGI