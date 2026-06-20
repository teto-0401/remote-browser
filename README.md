# remote-browser (VNC Type)

Cloud-based remote browser system using VNC stack (Oracle Cloud / Docker-ready).

## 🚀 Overview

This project runs a full graphical Linux desktop with Chromium in the cloud and exposes it through a browser using noVNC.

It is designed for:
- Remote development
- Lightweight cloud browsing
- Low-latency remote UI (~200–400ms)

---

## 🧱 Architecture

```
User Browser
   ↓
noVNC (Web UI)
   ↓
x11vnc (VNC server)
   ↓
Xvfb (virtual display)
   ↓
XFCE desktop
   ↓
Chromium browser
   ↓
Ubuntu VM (Oracle / Docker)
```

---

## 📦 Components

- Xvfb (virtual display)
- XFCE (lightweight desktop)
- Chromium (browser)
- x11vnc (VNC server)
- noVNC (web client)
- Node.js (control server)

---

## ⚙️ Quick Start (Oracle VM)

```bash
npm install
npm run install:env
npm run start:vnc
npm start
```

Then open:
```
http://<VM-IP>:6080
```

---

## 🐳 Docker Support (planned)

```bash
npm run docker:build
npm run docker:run
```

---

## 🧪 Scripts

- `npm run install:env` → install dependencies
- `npm run start:vnc` → start Xvfb + XFCE + VNC + Chrome
- `npm start` → Node control server

---

## ⚠️ Notes

- Not intended for bypassing restrictions
- Performance depends on network latency
- Best used with Oracle Cloud Tokyo region

---

## 🔥 Status

MVP stage: VNC stack fully defined, runtime scripts implemented, Dockerization next step.
