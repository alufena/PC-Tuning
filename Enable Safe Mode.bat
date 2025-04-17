@echo off
chcp 65001 > nul
echo Ativando modo de segurança...
bcdedit /set {current} safeboot minimal
echo Modo de segurança será ativado na próxima inicialização.
echo O computador será desligado em 5 segundos.
echo Pressione CTRL+C para cancelar.
timeout /t 5
shutdown /s /t 0