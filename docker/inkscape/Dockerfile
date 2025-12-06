FROM ubuntu:22.04

RUN apt update
RUN apt upgrade -y
RUN apt install -y inkscape
RUN apt install -y python3-pip
RUN pip install pillow

ENTRYPOINT ["sleep", "infinity"]
