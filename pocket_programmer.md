# Pocket Programmer

**How to turn a basic Android phone into a dev powerhouse**

## Essential Apps

- **Terminal**

  - **Termux**

    - Huge OSS community
    - Get from [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases)
    - more advantages if phone is rooted
    - Use `termux-setup-storage` to access device storage
    - For better performance, consider using a Linux chroot environment via [Andronix](https://andronix.app/)

  - **Terminus** – simple, great for SSH

- **Web/PHP Server**

  - **KSWEB** – PHP + MySQL (paid features 🏴‍☠️)

- **IDE**

  - **Acode** – good IDE, connects to Termux shell

    1. Install `acodex-server` plugin in Termux
    2. Install same plugin in Acode
    3. Run server in Termux

    ```bash
    pkg install openssh -y
    sshd
    ```

    4. Use `Ctrl + K` in Acode for terminal

  - Alternatively, use `sshd` to run a server and access it via `ssh` on VSCode on your PC

- **REST Client**

  - **API Tester**
  - Try other alternatives based on your needs

- **Browser**

  - **F12** – Inspect web pages
  - **Via Browser** – super lightweight

- **File Manager**

  - **X-plore** – has wifi file sharing, ssh, ftp, and much more (paid features 🏴‍☠️)

- **Keyboard**

  - **Unexpected Keyboard** – OSS, highly customizable
  - **Futo** – fully offline, gboard-like keyboard

- **PC Tools**

  - **adb** – Android Debug Bridge (connect to Android devices)
  - **scrcpy** – Android screen mirroring (screen mirroring)
  - **UAD** – Universal Android Debloater (remove bloatware)

- **For more `new OS` experience**
  - try [Andronix](https://andronix.app/)
  - [Tutorial](https://youtu.be/jvuufPWKF3k)

---

## MongoDB on Termux

- [Install MongoDB on Android Guide](https://micropreneur.life/how-to-install-mongodb-on-android-run-it-natively-no-mongodb-account-needed/)

```bash
pkg update && pkg upgrade
pkg install tur-repo -y
pkg install mongodb -y
mongod       # start server
mongo        # connect
```

(SQL can be installed similarly)

---

## Node.js + React Dev on Android

Follow Node setup guide: [How to Build React Applications Using Android Phone.](https://dev.to/andrewezeani/how-to-build-react-applications-using-an-android-phone-a-step-by-step-guide-4amh)

**Vite React Setup**:

```bash
npm create vite@latest project-name -- --template react
```

**vite.config.js**:

```js
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {
    host: "0.0.0.0",
    port: 3000,
    proxy: {
      "/api": {
        target: "http://localhost:3001",
        changeOrigin: true,
        secure: false,
      },
    },
  },
});
```

- Connect both devices to same LAN
- Access `<phone_ip>:3000` from PC or phone

---

## Control Android from PC

- **Code anywhere** → Use your PC's keyboard/mouse while running apps on your phone
- **Big screen advantage** → Avoid squinting at small phone displays during development
- **Zero setup delays** → Connect to any Windows/Mac/Linux PC in seconds
- **Battery-friendly** → Phone acts as compute device while PC handles display

**Windows**

- Use [Scrcpy](https://github.com/Genymobile/scrcpy/releases) to use your PC to control your phone.
- I use a custom script for scrcpy along with [adb](https://developer.android.com/studio/command-line/adb) to set the screen density and size to 768x1360 for a better experience.
- scrcpy comes with a copy of adb, so you don't need to install it separately.

_example script:_

```bat
@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

rem Get original density and size
for /f "tokens=3" %%a in ('adb shell wm density') do set original_density=%%a
for /f "tokens=3" %%a in ('adb shell wm size') do set original_size=%%a

rem Set temporary density and size
adb shell wm density 200
adb shell wm size 768x1360

rem Launch scrcpy
scrcpy --keyboard=uhid --shortcut-mod=lalt %*

rem Restore original values
adb shell wm density !original_density!
adb shell wm size !original_size!
rem or adb shell wm size reset

endlocal
```

**Linux**:

```bash
apt install scrcpy
scrcpy --hid-keyboard --shortcut-mod=lalt
```

**scrcpy shortcuts**:

- **Keyboard Shortcuts**:
  _(Alt is the shortcut modifier key)_
  - `Alt+P` → Power button
  - `Alt+H` → Home button
  - `Alt+F` → Fullscreen
  - `Alt+N` → Notification
  - `2 Finger tap` → Back button
  - `Alt+up/down` → Volume up/down

_Prefferably use USB cable for low latency._
**Connection Methods**:

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
