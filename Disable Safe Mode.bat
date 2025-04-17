@echo off
chcp 65001 > nul
echo Desativando modo de segurança...
bcdedit /deletevalue {current} safeboot
echo O sistema voltará ao modo normal na próxima inicialização.
pause