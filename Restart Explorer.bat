tasklist | find "firefox.exe" > nul && set restart_firefox=1
taskkill /f /im explorer.exe
taskkill /f /im dwm.exe
taskkill /f /im NVDisplay.Container.exe
taskkill /f /t /im firefox.exe
timeout /t 1 /nobreak > nul
start explorer.exe
if defined restart_firefox start firefox.exe
