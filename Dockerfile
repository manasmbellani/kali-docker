FROM kalilinux/kali-rolling

ARG USER=root
ARG VNC_PASSWORD=toortoor

ENV USER ${USER}
ENV VNC_PASSWORD ${VNC_PASSWORD}

# Install more Kali tools
RUN apt-get update -y && apt-get install -y metasploit-framework
RUN apt-get install -y dirb

# Install basic linux tools
RUN apt-get install -y iproute2

# Install a VNC server
RUN apt-get install xfce4 xfce4-goodies -y \
    && apt-get install tightvncserver -y \
    && USER=$USER echo -e "$VNC_PASSWORD\n" | USER=$USER vncpasswd -f > /root/.vnc/passwd \
    && echo -e "#!/bin/bash\nxrdb /root/.Xresources\nstartxfce4 &" > /root/.vnc/xstartup \
    && chmod +x /root/.vnc/xstartup


ENTRYPOINT bash
