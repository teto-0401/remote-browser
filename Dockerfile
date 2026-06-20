FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# basic deps
RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    xvfb \
    x11vnc \
    chromium-browser || apt install -y chromium \
    curl git sudo nodejs npm \
    dbus-x11 \
    && apt clean

# working dir
WORKDIR /app

# copy project
COPY . /app

# install node deps
RUN npm install || true

# expose VNC + noVNC
EXPOSE 6080 5900 3000

# start script
CMD ["bash", "scripts/start.sh"]
