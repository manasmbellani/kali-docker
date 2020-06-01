# kali-docker

A Dockerfile used to build a docker image containing an ephemeral instance of Kali Linux.

## Build
Clone this repository and then in the directory containing the `Dockerfile` run:

`docker build -t lodestone-security/kali-docker .`

To run the image use the following:

*Command line kali only, without VNC*

`docker run -ti lodestone-security/kali-docker`

*With VNC*

`docker run -ti -p 127.0.0.1:5901:5901 lodestone-security/kali-docker`

**Note: The default VNC password is 'toortoor'. You should never expose this docker to the internet and should only use VNC over an  SSH tunnel.**.
