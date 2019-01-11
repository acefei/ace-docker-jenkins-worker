FROM jenkins/ssh-slave

MAINTAINER acefei

USER root
RUN echo "deb http://ftp.uk.debian.org/debian buster main" >> /etc/apt/sources.list \
        && apt-get update  \
        && apt-get install -y \
            python3-pip \
        && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

# drop back to the regular jenkins user - good practice
USER jenkins
