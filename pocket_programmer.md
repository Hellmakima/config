# Android Development Setup Guide

Turn your Android device into a full-fledged development environment for MERN stack projects (MongoDB, Express, React, Node.js).

## 📋 Table of Contents
1. [Essential Apps](#-essential-apps)
2. [MongoDB Setup](#-mongodb-setup)
3. [Node.js Setup](#-nodejs-setup)
4. [React + Vite Setup](#-react--vite-setup)
5. [Frontend-Backend Connection](#-frontend-backend-connection)
6. [Android Debugging](#-android-debugging)
7. [Acode Server Setup](#-acode-server-setup)
8. [Alternative Tools](#-alternative-tools)

## 📱 Essential Apps
| App | Purpose | Play Store Link |
|------|---------|-----------------|
| Termux | Terminal emulator | [Play Store](https://play.google.com/store/apps/details?id=com.termux) | [F-Droid](https://termux.com/fdroid) |
| Acode | Code editor/IDE | [Download](https://play.google.com/store/apps/details?id=com.foxdebug.acodefree) |
| API Tester | Postman alternative | [Download](https://play.google.com/store/apps/details?id=apitester.apitester) |
| F12 | Web inspector | [Download](https://play.google.com/store/apps/details?id=com.flowplanner.f12) |

## 🍃 MongoDB Setup
### Installation
```bash
pkg update && pkg upgrade
pkg install tur-repo -y
pkg install mongodb -y
```

### Usage
Start MongoDB server:
```bash
mongod --dbpath=/data/db
```
or
```
mongod
```

Connect to MongoDB:
```bash
mongo
```

## ⚡ Node.js Setup
1. Install Node.js:
```bash
pkg install nodejs -y
```

2. Verify installation:
```bash
node --version
npm --version
```

## ⚛️ React + Vite Setup
1. Create new project:
```bash
npm create vite@latest project-name -- --template react
```

2. Configure `vite.config.js`:
```javascript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // Access from other devices
    port: 3000,
    proxy: {
      '/api': {
        target: 'http://localhost:3001',
        changeOrigin: true,
        secure: false,
      },
    },
  },
});
```

## 🔗 Frontend-Backend Connection
1. Install router:
```bash
npm install react-router-dom
```

2. Connect both devices to same network
3. Access from PC: `http://<phone-ip>:3000`

## 🔧 Android Debugging
### **Why This is Powerful**
Transform your Android into a portable workstation! Scrcpy mirrors your phone screen to any computer, letting you:
- **Code anywhere** → Use your PC's keyboard/mouse while running apps on your phone
- **Big screen advantage** → Avoid squinting at small phone displays during development
- **Zero setup delays** → Connect to any Windows/Mac/Linux PC in seconds
- **Battery-friendly** → Phone acts as compute device while PC handles display

### **Setup Guide**
1. **Enable USB Debugging**:
   - Go to `Settings > About Phone > Build Number` (tap 7 times to unlock Developer Options)
   - Enable **USB Debugging** and **Wireless Debugging**

2. **Connection Methods**:
   - **USB Cable** (Recommended for stability):
     ```bash
     scrcpy --hid-keyboard --shortcut-mod=lalt
     ```
   - **Wireless** (No cables needed):
     ```bash
     adb tcpip 5555  # First connect via USB
     adb connect YOUR_PHONE_IP:5555
     scrcpy
     ```

3. **Optimize Display** (Optional):
   ```bash
   # Higher resolution for coding:
   adb shell wm size 1280x720  
   # Revert when done:
   adb shell wm size reset
   ```

4. **My Setup**:
Create `run.bat`:
     ```bat
     @echo off
     adb shell wm density 200
     adb shell wm size 768x1366
     scrcpy.exe --keyboard=uhid --shortcut-mod=lalt %*
     adb shell wm density 400
     adb shell wm size reset
     ```

### **Workflow Example**
1. Connect phone to library PC via USB  
2. Run `scrcpy` → Your phone screen appears on PC  
3. Use Termux+VSCode on phone, but type comfortably on PC keyboard  
4. Test React apps directly on your Android while coding  

### **Pro Tips**
- **Keyboard Shortcuts**:
  - `Alt+O` → Power button  
  - `Alt+H` → Home button  
- **File Transfer**: Drag-and-drop files between PC and phone while connected  
- **Multi-Device**: Run multiple instances for testing different screen sizes  

**Perfect for**: Coffee shop coding, travel development, or when you need a bigger screen instantly!  

---

## 💻 Acode Server Setup
1. Install plugin in Acode
2. In Termux:
```bash
pkg install openssh -y
sshd
```
3. Connect via Acode's terminal (Ctrl+K)

## 🔄 Alternative Tools
| Category | Primary | Alternatives |
|----------|---------|--------------|
| Terminal | Termux | [Termius](https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client), [NeoTerm](https://github.com/NeoTerm/NeoTerm) |
| Code Editor | Acode | [Dcoder](https://play.google.com/store/apps/details?id=com.paprbit.dcoder), [Spck Editor](https://play.google.com/store/apps/details?id=io.spck) |
| API Client | API Tester | [Postwoman](https://postwoman.io/), [Insomnia](https://insomnia.rest/) |
| Web Inspector | F12 | [Eruda](https://github.com/liriliri/eruda) (Browser console) |

## 💡 Pro Tips
- Use `termux-setup-storage` to access device storage
- For better performance, consider using a Linux chroot environment via [Andronix](https://andronix.app/)
- Set up Git in Termux:
  ```bash
  pkg install git -y
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```
