@echo off

"C:\Program Files\scrcpy-win64-v2.7\adb.exe" shell wm density 200
"C:\Program Files\scrcpy-win64-v2.7\adb.exe" shell wm size 768x1366

"C:\Program Files\scrcpy-win64-v2.7\scrcpy.exe" --keyboard=uhid --shortcut-mod=lalt %*

"C:\Program Files\scrcpy-win64-v2.7\adb.exe" shell wm density 400
"C:\Program Files\scrcpy-win64-v2.7\adb.exe" shell wm size reset