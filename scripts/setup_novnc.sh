#!/bin/bash

set -e

# Remote Browser - noVNC setup script

echo "[1/3] Creating public directory..."
mkdir -p public

cd public

echo "[2/3] Cloning noVNC..."
if [ -d "noVNC" ]; then
  echo "noVNC already exists, skipping clone"
else
  git clone https://github.com/novnc/noVNC.git
fi

echo "[3/3] Initializing submodules..."
cd noVNC

git submodule update --init --recursive

echo "[OK] noVNC setup complete"
echo "Run: npm run start:vnc"
