FROM debian

RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo -y
RUN apt install xdg-utils -y
RUN apt install firefox-esr -y
RUN apt install software-properties-common -y
RUN apt update -y
RUN apt install -yqq --no-install-recommends 
RUN apt install git -y
RUN apt install unzip -y
RUN apt install curl -y
RUN apt-cache search openjdk | grep 17
RUN apt install openjdk-17-jdk -y
RUN apt install -qqy x11-apps
RUN apt install maven -y
RUN apt install x11-xserver-utils -y
RUN apt install mesa-utils -y
RUN apt install libgl1-mesa-glx -y 
RUN apt install libgl1-mesa-dri -y
RUN apt install libgl1-mesa-dev -y
RUN apt install libgtk-3-0 -y
RUN apt install libxext6 -y
RUN apt install libxrender1 -y
RUN apt install libxtst6 -y
RUN apt install libxi6 -y
RUN apt install net-tools -y
RUN apt install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev -y
RUN apt update -y 
RUN apt upgrade -y
RUN export XAUTHORITY=~/.Xauthority

ENV DISPLAY host.docker.internal:0

RUN useradd -ms /bin/bash admin
RUN adduser admin sudo
USER admin
WORKDIR /home/admin
RUN git clone https://github.com/Gasu16/DockerFlexchain.git
RUN git clone https://github.com/Gasu16/OffChainProcessor.git
RUN mkdir OpenJFX
WORKDIR OpenJFX/
RUN curl https://download2.gluonhq.com/openjfx/17.0.0.1/openjfx-17.0.0.1_linux-x64_bin-sdk.zip -o openjfx-17.0.0.1.zip
RUN unzip openjfx-17.0.0.1.zip
WORKDIR /home/admin/DockerFlexchain

CMD java --module-path /home/admin/OpenJFX/javafx-sdk-17.0.0.1/lib --add-modules=javafx.controls,javafx.fxml -Dprism.order=sw -jar target/Translator-1.0-SNAPSHOT-jar-with-dependencies.jar


