# Version: 0.0.1
FROM centos:centos6
MAINTAINER Lustov Stepan <lustovs@gmail.com>

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
RUN     yum install -y epel-release
# Install Node.js and npm
RUN     yum install -y nodejs npm

# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install

# Bundle app source
COPY . /src

EXPOSE  80
CMD ["node", "/src/index.js"]

