# CMAKE - ARM32v7 CrossCompiling Setup

## Dependencies 

  - ubuntu >= 18.x 
  - docker

## Installing docker on ubuntu
  - docker https://docs.docker.com/install/linux/docker-ce/ubuntu/
  - docker-compose https://docs.docker.com/compose/install/


## 1 - Building the docker image

```
$ ./build.sh
```

## 2 - Installing dependencies

To install project dependecies on system level add your dependencies to the Dockerfile in the RUN apt-get section.
```
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --allow-remove-essential apt-utils:armhf vim git-core wget g++-8-arm-linux-gnueabihf curl:armhf pkg-config:armhf apt-transport-https:armhf \
  your-dependencies.... \
  ...\
  && rm -rf /var/lib/apt/lists/*
```

IMPORTANT! You need to rebuild the docker image.

# Using the project to cross compile.

## 1 - Setup

Add your project to the code folder

```
$ git clone --recurse https://github.com/cgi-studio-gmbh/cmake-example.git
```

Add the project to the docker-compose.yml file

```
version: '3'
services:
  cex: # arbitrary name you will use to call the service later
    image: arm32v7-gcc-83
    volumes:
      - ./code:/home/code/CGI
    command: ["bash", "compile.sh", "true", "cmake-example", "install", "Release"]
  ...
  ...
  ...
  ```

## 2 - Compiling

On the top level (in the folder where docker-compose.yml exists) call

```
$ docker-compose up cex // cex is the name we gave to our project in the yaml file.
```

## 3 - Using the compiled libraries or executables

Navigate the the project in code. The compiled libs and bin should be in a folder called install.
Copy them to the board and run.