# Usage Instructions
# ------------------
# Install:
#     docker build -t kali-docker:latest .
# Run:
#     docker run -it --rm -p 15900-15910:5900-5910 kali-docker:latest
# 
FROM kalilinux/kali-rolling

ARG USER=root
ENV USER ${USER}

# Install apt utils
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# Install basic linux tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y iproute2

# Install a VNC server
RUN DEBIAN_FRONTEND=noninteractive apt-get install xfce4 xfce4-goodies -y \
    && apt-get install tightvncserver -y

RUN mkdir -p /root/.vnc
RUN USER= echo -e "#!/bin/bash\nxrdb /root/.Xresources\nstartxfce4 &" > /root/.vnc/xstartup \
    && chmod +x /root/.vnc/xstartup

# Install other tools
RUN apt install -y nano
RUN apt install -y vim
RUN apt install -y locate
RUN apt install -y iputils-ping
RUN apt install -y axel

# Install net tools requirement
RUN apt install -y net-tools

# Install dbus-x11
RUN apt install -y dbus-x11

# Update the locatedb
RUN updatedb

ENTRYPOINT bash
