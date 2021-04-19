# kali-docker

A Dockerfile used to build a docker image containing an ephemeral instance of Kali Linux.
Based on the excellent script prepared by `lodestone-security`.

## manasmbellani/kali-docker right away
If you have docker and git installed and want to use this right away you can do the following:
```
git clone https://github.com/manasmbellani/kali-docker
cd kali-docker
docker build -t kali-docker .
docker run --rm -ti -p 15900-15910:5900-5910 kali-docker:latest
```
At this point you can either use the command line or run `vncserver` and go
through the configuration to start a vncserver that you can connect to on
`127.0.0.1:5901`.

## Build
Clone this repository and then in the directory containing the `Dockerfile` run:

`docker build -t kali-docker:latest .`

## Run
To run the image with VNC, use the following:

`docker run --rm -ti -p 15900-15910:5900-5910 kali-docker:latest`

Then run `./startvnc.sh` while entering the password for vnc server

## Confirm if vnc has started
Inside container, run the command:
```
./startvnc.sh
```

## Connect to client

### Via mac
```
open vnc://127.0.0.1:5901
```