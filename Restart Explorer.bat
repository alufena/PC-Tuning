tasklist | find "firefox.exe" > nul && set restart_firefox=1
tasklist | find "chrome.exe" > nul && set restart_chrome=1
tasklist | find "msedge.exe" > nul && set restart_edge=1
taskkill /f /im explorer.exe
taskkill /f /im dwm.exe
taskkill /f /im NVDisplay.Container.exe
taskkill /f /t /im firefox.exe
taskkill /f /t /im chrome.exe
taskkill /f /t /im msedge.exe
timeout /t 1 /nobreak > nul
start explorer.exe
if defined restart_firefox start firefox.exe
if defined restart_chrome start chrome.exe
if defined restart_edge start msedge.exe
