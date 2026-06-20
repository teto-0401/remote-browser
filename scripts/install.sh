#!/bin/bash

set -e

# Remote Browser - Environment Install Script (Oracle Ubuntu)

echo "[1/6] Updating packages..."
sudo apt update -y

echo "[2/6] Installing desktop environment (XFCE)..."
sudo apt install -y xfce4 xfce4-goodies

echo "[3/6] Installing virtual display (Xvfb)..."
sudo apt install -y xvfb

echo "[4/6] Installing VNC server (x11vnc)..."
sudo apt install -y x11vnc

echo "[5/6] Installing browser (Chromium)..."
sudo apt install -y chromium-browser || sudo apt install -y chromium

echo "[6/6] Installing Node.js dependencies..."
sudo apt install -y nodejs npm git curl

echo "\n[OK] Environment setup complete."
echo "Next: npm install && npm run start:vnc"
