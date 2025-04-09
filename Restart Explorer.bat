taskkill /f /im explorer.exe
taskkill /f /im NVDisplay.Container.exe
timeout /t 1 /nobreak > nul
start explorer.exe
