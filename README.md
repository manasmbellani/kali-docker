# kali-docker

A Dockerfile used to build a docker image containing an ephemeral instance of Kali Linux.


## Use lodestone-security/kali-docker right away
If you have docker and git installed and want to use this right away you can do the following:
```
git clone https://github.com/lodestone-security/kali-docker
cd kali-docker
docker build -t lodestone-security/kali-docker .
docker run -ti -p 127.0.0.1:5901:5901 lodestone-security/kali-docker
```
At this point you can either use the command line or run `vncserver` and go
through the configuration to start a vncserver that you can connect to on
`127.0.0.1:5901`.

If you don't have docker installed, or want more specific instructions, check
the section below.

## Build
Clone this repository and then in the directory containing the `Dockerfile` run:

`docker build -t lodestone-security/kali-docker .`

## Run
To run the image use the following:

**Command line kali only, without VNC**
`docker run -ti lodestone-security/kali-docker`

**With VNC**
`docker run -ti -p 127.0.0.1:5901:5901 lodestone-security/kali-docker`

*Note: You will need to run vncserver and set a password to use the vncserver. You should never expose this docker to the internet and should only use VNC on the localhost or over an SSH tunnel.*

## Installing Docker on Debian 10
*Its probably better to find official documentation on this as this may not be up to date. This is mostly here for my convenience.*

```
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```
