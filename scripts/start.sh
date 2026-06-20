#!/bin/bash

set -e

# Remote Browser VNC Startup Script

export DISPLAY=:1
RESOLUTION="1280x720x24"

echo "[1/5] Starting Xvfb..."
Xvfb :1 -screen 0 $RESOLUTION &
XVFB_PID=$!

sleep 2

echo "[2/5] Starting XFCE desktop..."
startxfce4 &

sleep 2

echo "[3/5] Starting Chromium..."
chromium \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --window-size=1280,720 &

sleep 2

echo "[4/5] Starting x11vnc server..."
x11vnc \
  -display :1 \
  -nopw \
  -forever \
  -shared \
  -rfbport 5900 \
  -bg

sleep 2

echo "[5/5] Starting noVNC proxy..."

if [ ! -d "public/noVNC" ]; then
  echo "noVNC not found. Please clone it into public/noVNC"
else
  cd public/noVNC
  ./utils/novnc_proxy --vnc localhost:5900 --listen 6080 &
fi

cd ../../server || true
node index.js
