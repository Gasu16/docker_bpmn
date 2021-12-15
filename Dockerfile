#FROM adoptopenjdk/maven-openjdk11:latest
FROM debian

RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo -y
RUN apt install xdg-utils -y
RUN apt install firefox-esr -y
RUN apt install vim -y
RUN apt install git -y
RUN apt install curl -y
RUN apt install openjfx -y
RUN apt install unzip -y
RUN apt install -qqy x11-apps
RUN apt install x11-xserver-utils -y
RUN apt install maven -y
RUN apt-cache search openjdk | grep 17
RUN apt install openjdk-17-jdk -y
RUN export XAUTHORITY=~/.Xauthority
ENV DISPLAY :0
RUN useradd -ms /bin/bash admin
RUN adduser admin sudo
USER admin
WORKDIR /home/admin
RUN git clone https://github.com/Gasu16/Bpmn.git 
RUN git clone https://bitbucket.org/proslabteam/flexchain.git
RUN git clone https://github.com/Gasu16/CleanMaven.git
RUN mkdir OpenJFX
WORKDIR OpenJFX/
RUN curl https://download2.gluonhq.com/openjfx/17.0.0.1/openjfx-17.0.0.1_linux-x64_bin-sdk.zip -o openjfx-17.0.0.1.zip
RUN unzip openjfx-17.0.0.1.zip
WORKDIR /home/admin/Bpmn/
#CMD ["./run"]
