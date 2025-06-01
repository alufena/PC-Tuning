@echo off
cd /d "%~dp0"

:: CAMINHO DO ADB
:: Altere este caminho se o ADB estiver em outro local no seu computador.
:: Exemplo: set ADB="C:\Caminho\Para\Seu\adb.exe"
set ADB="C:\Program Files (x86)\Scrcpy\adb.exe"

:: MENSAGEM INICIAL
echo INICIANDO O MELODY SCRIPT PARA ANDROID...
echo Este script aplica otimizacoes para dispositivos Android 7.1.1 ou superior.
echo Para Samsung, e recomendado Android 9+ com OneUI.
echo.

:: PASSO 1: VERIFICAR SE O ADB EXISTE
echo [PASSO 1] Verificando ADB...
if exist %ADB% (
    echo ADB encontrado em %ADB%
) else (
    echo ERRO: ADB nao encontrado em %ADB%. Verifique o caminho e tente novamente.
    pause
    exit /b
)

:: PASSO 2: VERIFICAR DISPOSITIVOS CONECTADOS
echo [PASSO 2] Verificando dispositivos conectados...
%ADB% devices
echo Certifique-se de que seu dispositivo esta listado acima com status 'device'.
echo.

:: PASSO 3: INICIAR AJUSTES
echo [PASSO 3] Aplicando ajustes do Melody Script...
echo.

:: MELHORIAS VISUAIS
:: Desativa efeitos de desfoque e animacoes para melhorar a fluidez visual.
:: Comandos de refresh rate (48Hz) estao comentados; descomente para ativar.
echo Ajustando animacoes e transparencias...
%ADB% shell settings put global accessibility_reduce_transparency 1 2>nul && echo [OK] accessibility_reduce_transparency || echo [FALHOU] accessibility_reduce_transparency
%ADB% shell settings put global disable_window_blurs 1 2>nul && echo [OK] disable_window_blurs || echo [FALHOU] disable_window_blurs
%ADB% shell settings put global window_animation_scale 0.0 2>nul && echo [OK] window_animation_scale || echo [FALHOU] window_animation_scale
%ADB% shell settings put global transition_animation_scale 0.0 2>nul && echo [OK] transition_animation_scale || echo [FALHOU] transition_animation_scale
%ADB% shell settings put global animator_duration_scale 0.0 2>nul && echo [OK] animator_duration_scale || echo [FALHOU] animator_duration_scale
%ADB% shell settings put system screen_auto_brightness_adj 1.0 2>nul && echo [OK] screen_auto_brightness_adj || echo [FALHOU] screen_auto_brightness_adj
:: Descomente as proximas duas linhas para ajustar a taxa de atualizacao para 48Hz (pode nao funcionar em dispositivos mais antigos).
%ADB% shell settings put system peak_refresh_rate 48.0 2>nul && echo [OK] peak_refresh_rate || echo [FALHOU] peak_refresh_rate
%ADB% shell settings put system min_refresh_rate 1.0 2>nul && echo [OK] min_refresh_rate || echo [FALHOU] min_refresh_rate
:: Descomente as proximas duas linhas para reverter a taxa de atualizacao ao padrao do dispositivo (geralmente 60Hz).
:: %ADB% shell settings put system peak_refresh_rate 60.0 2>nul && echo [OK] peak_refresh_rate revertido || echo [FALHOU] peak_refresh_rate revertido
:: %ADB% shell settings put system min_refresh_rate 60.0 2>nul && echo [OK] min_refresh_rate revertido || echo [FALHOU] min_refresh_rate revertido
echo.

:: MELHORIAS DE REDE
:: Otimiza a conexao de dados moveis e Wi-Fi, desativa economia de energia de Wi-Fi,
:: ativa dados moveis ao ligar o celular e configura DNS para bloquear anuncios.
echo Ajustando configuracoes de rede...
%ADB% shell settings put global network_recommendations_enabled 0 2>nul && echo [OK] network_recommendations_enabled || echo [FALHOU] network_recommendations_enabled
%ADB% shell settings put global network_scoring_ui_enabled 0 2>nul && echo [OK] network_scoring_ui_enabled || echo [FALHOU] network_scoring_ui_enabled
%ADB% shell settings put global tether_offload_disabled 0 2>nul && echo [OK] tether_offload_disabled || echo [FALHOU] tether_offload_disabled
%ADB% shell settings put global wifi_power_save 0 2>nul && echo [OK] wifi_power_save || echo [FALHOU] wifi_power_save
%ADB% shell settings put global enable_cellular_on_boot 1 2>nul && echo [OK] enable_cellular_on_boot || echo [FALHOU] enable_cellular_on_boot
%ADB% shell settings put global mobile_data_always_on 0 2>nul && echo [OK] mobile_data_always_on || echo [FALHOU] mobile_data_always_on
%ADB% shell settings put global ble_scan_always_enabled 0 2>nul && echo [OK] ble_scan_always_enabled || echo [FALHOU] ble_scan_always_enabled
%ADB% shell settings put global private_dns_specifier dns.adguard.com 2>nul && echo [OK] private_dns_specifier || echo [FALHOU] private_dns_specifier
%ADB% shell settings put global preferred_network_mode 9,9 2>nul && echo [OK] preferred_network_mode || echo [FALHOU] preferred_network_mode
:: Configurar DNS (usando IPs do dns.adguard.com para compatibilidade com Android 8.1.0)
:: Nota: Estes comandos podem nao funcionar no Android 8.1.0; use o app DNS Changer para configurar o dns.adguard.com.
%ADB% shell settings put global wifi_dns1 "94.140.14.14" 2>nul && echo [OK] wifi_dns1 || echo [FALHOU] wifi_dns1
%ADB% shell settings put global wifi_dns2 "94.140.15.15" 2>nul && echo [OK] wifi_dns2 || echo [FALHOU] wifi_dns2
%ADB% shell settings put global mobile_data_dns1 "94.140.14.14" 2>nul && echo [OK] mobile_data_dns1 || echo [FALHOU] mobile_data_dns1
%ADB% shell settings put global mobile_data_dns2 "94.140.15.15" 2>nul && echo [OK] mobile_data_dns2 || echo [FALHOU] mobile_data_dns2
echo.

:: GERENCIAMENTO DE ENERGIA
:: Desativa algoritmos de sono adaptativo e economia de energia para melhorar
:: o desempenho e evitar atrasos em notificacoes.
echo Ajustando gerenciamento de energia...
%ADB% shell settings put global sem_enhanced_cpu_responsiveness 0 2>nul && echo [OK] sem_enhanced_cpu_responsiveness || echo [FALHOU] sem_enhanced_cpu_responsiveness
%ADB% shell settings put global enhanced_processing 0 2>nul && echo [OK] enhanced_processing || echo [FALHOU] enhanced_processing
%ADB% shell settings put global app_standby_enabled 0 2>nul && echo [OK] app_standby_enabled || echo [FALHOU] app_standby_enabled
%ADB% shell settings put global adaptive_battery_management_enabled 0 2>nul && echo [OK] adaptive_battery_management_enabled || echo [FALHOU] adaptive_battery_management_enabled
%ADB% shell settings put global app_restriction_enabled true 2>nul && echo [OK] app_restriction_enabled || echo [FALHOU] app_restriction_enabled
%ADB% shell settings put system intelligent_sleep_mode 0 2>nul && echo [OK] intelligent_sleep_mode || echo [FALHOU] intelligent_sleep_mode
%ADB% shell settings put secure adaptive_sleep 0 2>nul && echo [OK] adaptive_sleep || echo [FALHOU] adaptive_sleep
%ADB% shell settings put global automatic_power_save_mode 0 2>nul && echo [OK] automatic_power_save_mode || echo [FALHOU] automatic_power_save_mode
%ADB% shell settings put global low_power 0 2>nul && echo [OK] low_power || echo [FALHOU] low_power
%ADB% shell settings put global dynamic_power_savings_enabled 0 2>nul && echo [OK] dynamic_power_savings_enabled || echo [FALHOU] dynamic_power_savings_enabled
%ADB% shell settings put global dynamic_power_savings_disable_threshold 20 2>nul && echo [OK] dynamic_power_savings_disable_threshold || echo [FALHOU] dynamic_power_savings_disable_threshold
echo.

:: ECONOMIA DE BATERIA (SCREENSAVER)
:: Desativa o protetor de tela para economizar bateria.
echo Desativando protetor de tela...
%ADB% shell settings put secure screensaver_enabled 0 2>nul && echo [OK] screensaver_enabled || echo [FALHOU] screensaver_enabled
%ADB% shell settings put secure screensaver_activate_on_sleep 0 2>nul && echo [OK] screensaver_activate_on_sleep || echo [FALHOU] screensaver_activate_on_sleep
%ADB% shell settings put secure screensaver_activate_on_dock 0 2>nul && echo [OK] screensaver_activate_on_dock || echo [FALHOU] screensaver_activate_on_dock
echo.

:: RESPOSTA DO SISTEMA
:: Reduz o tempo necessario para toques longos, melhorando a resposta.
echo Ajustando resposta do sistema...
%ADB% shell settings put secure long_press_timeout 250 2>nul && echo [OK] long_press_timeout || echo [FALHOU] long_press_timeout
%ADB% shell settings put secure multi_press_timeout 250 2>nul && echo [OK] multi_press_timeout || echo [FALHOU] multi_press_timeout
echo.

:: AJUSTES EM CHAMADAS
:: Ativa volume extra e reducao de ruido em chamadas, desativa vibracoes.
echo Ajustando configuracoes de chamadas...
%ADB% shell settings put system call_extra_volume 1 2>nul && echo [OK] call_extra_volume || echo [FALHOU] call_extra_volume
%ADB% shell settings put system call_noise_reduction 1 2>nul && echo [OK] call_noise_reduction || echo [FALHOU] call_noise_reduction
%ADB% shell settings put system call_answer_vib 0 2>nul && echo [OK] call_answer_vib || echo [FALHOU] call_answer_vib
%ADB% shell settings put system call_end_vib 0 2>nul && echo [OK] call_end_vib || echo [FALHOU] call_end_vib
%ADB% shell settings put global swipe_to_call_message 0 2>nul && echo [OK] swipe_to_call_message || echo [FALHOU] swipe_to_call_message
echo.

:: MUDAR NOME DO DISPOSITIVO
:: Altera o nome do dispositivo (Bluetooth e sistema) para "Celular".
echo Alterando nome do dispositivo...
%ADB% shell settings put secure bluetooth_name "Celular" 2>nul && echo [OK] bluetooth_name || echo [FALHOU] bluetooth_name
%ADB% shell settings put global device_name "Celular" 2>nul && echo [OK] device_name || echo [FALHOU] device_name
%ADB% shell settings put global synced_account_name "Celular" 2>nul && echo [OK] synced_account_name || echo [FALHOU] synced_account_name
echo.

:: SOM E VIBRACOES
:: Desativa sons e vibracoes desnecessarios, ativa sincronia de vibracao com toque.
echo Ajustando sons e vibracoes...
%ADB% shell settings put system navigation_gestures_vibrate 0 2>nul && echo [OK] navigation_gestures_vibrate || echo [FALHOU] navigation_gestures_vibrate
%ADB% shell settings put system lockscreen_sounds_enabled 0 2>nul && echo [OK] lockscreen_sounds_enabled || echo [FALHOU] lockscreen_sounds_enabled
%ADB% shell settings put system camera_feedback_vibrate 0 2>nul && echo [OK] camera_feedback_vibrate || echo [FALHOU] camera_feedback_vibrate
%ADB% shell settings put system sound_effects_enabled 0 2>nul && echo [OK] sound_effects_enabled || echo [FALHOU] sound_effects_enabled
%ADB% shell settings put system sync_vibration_with_ringtone 1 2>nul && echo [OK] sync_vibration_with_ringtone || echo [FALHOU] sync_vibration_with_ringtone
%ADB% shell settings put system sync_vibration_with_ringtone_2 1 2>nul && echo [OK] sync_vibration_with_ringtone_2 || echo [FALHOU] sync_vibration_with_ringtone_2
%ADB% shell settings put system sync_vibration_with_notification 1 2>nul && echo [OK] sync_vibration_with_notification || echo [FALHOU] sync_vibration_with_notification
%ADB% shell settings put system haptic_feedback_enabled 0 2>nul && echo [OK] haptic_feedback_enabled || echo [FALHOU] haptic_feedback_enabled
%ADB% shell settings put system SEM_VIBRATION_FORCE_TOUCH_INTENSITY 0 2>nul && echo [OK] SEM_VIBRATION_FORCE_TOUCH_INTENSITY || echo [FALHOU] SEM_VIBRATION_FORCE_TOUCH_INTENSITY
%ADB% shell settings put system SEM_VIBRATION_NOTIFICATION_INTENSITY 0 2>nul && echo [OK] SEM_VIBRATION_NOTIFICATION_INTENSITY || echo [FALHOU] SEM_VIBRATION_NOTIFICATION_INTENSITY
%ADB% shell settings put system SEM_VIBRATION_RING_INTENSITY 5 2>nul && echo [OK] SEM_VIBRATION_RING_INTENSITY || echo [FALHOU] SEM_VIBRATION_RING_INTENSITY
%ADB% shell settings put system vibrate_when_ringing 0 2>nul && echo [OK] vibrate_when_ringing || echo [FALHOU] vibrate_when_ringing
%ADB% shell settings put system vibration_sound_enabled 0 2>nul && echo [OK] vibration_sound_enabled || echo [FALHOU] vibration_sound_enabled
%ADB% shell settings put system VIB_FEEDBACK_MAGNITUDE 0 2>nul && echo [OK] VIB_FEEDBACK_MAGNITUDE || echo [FALHOU] VIB_FEEDBACK_MAGNITUDE
%ADB% shell settings put system VIB_RECVCALL_MAGNITUDE 0 2>nul && echo [OK] VIB_RECVCALL_MAGNITUDE || echo [FALHOU] VIB_RECVCALL_MAGNITUDE
echo.

:: SONS DE ENERGIA E CARREGAMENTO
:: Desativa sons e vibracoes relacionados a energia e carregamento.
echo Ajustando sons de energia e carregamento...
%ADB% shell settings put global power_sounds_enabled 0 2>nul && echo [OK] power_sounds_enabled || echo [FALHOU] power_sounds_enabled
%ADB% shell settings put secure charging_vibration_enabled 0 2>nul && echo [OK] charging_vibration_enabled || echo [FALHOU] charging_vibration_enabled
%ADB% shell settings put secure charging_sounds_enabled 0 2>nul && echo [OK] charging_sounds_enabled || echo [FALHOU] charging_sounds_enabled
%ADB% shell settings put secure adaptive_charging_enabled 0 2>nul && echo [OK] adaptive_charging_enabled || echo [FALHOU] adaptive_charging_enabled
echo.

:: CODECS DE AUDIO BLUETOOTH
:: Ativa codecs de alta qualidade para audio Bluetooth.
echo Ajustando codecs de audio Bluetooth...
%ADB% shell settings put secure bluetooth_a2dp_bt_uhq_state 1 2>nul && echo [OK] bluetooth_a2dp_bt_uhq_state || echo [FALHOU] bluetooth_a2dp_bt_uhq_state
%ADB% shell settings put secure bluetooth_a2dp_uhqa_support 1 2>nul && echo [OK] bluetooth_a2dp_uhqa_support || echo [FALHOU] bluetooth_a2dp_uhqa_support
echo.

:: AJUSTES GOOGLE
:: Desativa recursos do Google para economizar bateria e melhorar privacidade.
echo Desativando recursos do Google...
%ADB% shell settings put system gearhead:driving_mode_settings_enabled 0 2>nul && echo [OK] gearhead:driving_mode_settings_enabled || echo [FALHOU] gearhead:driving_mode_settings_enabled
%ADB% shell settings put secure assistant 0 2>nul && echo [OK] assistant || echo [FALHOU] assistant
%ADB% shell settings put secure smartspace 0 2>nul && echo [OK] smartspace || echo [FALHOU] smartspace
%ADB% shell settings put global google_core_control 0 2>nul && echo [OK] google_core_control || echo [FALHOU] google_core_control
%ADB% shell settings put secure adaptive_connectivity_enabled 0 2>nul && echo [OK] adaptive_connectivity_enabled || echo [FALHOU] adaptive_connectivity_enabled
%ADB% shell settings put secure systemui.google.opa_enabled 0 2>nul && echo [OK] systemui.google.opa_enabled || echo [FALHOU] systemui.google.opa_enabled
echo.

:: DESATIVAR SENSORES DE MOVIMENTO
:: Desativa sensores de movimento para economizar bateria.
echo Desativando sensores de movimento...
%ADB% shell settings put system master_motion 0 2>nul && echo [OK] master_motion || echo [FALHOU] master_motion
%ADB% shell settings put system motion_engine 0 2>nul && echo [OK] motion_engine || echo [FALHOU] motion_engine
%ADB% shell settings put system air_motion_engine 0 2>nul && echo [OK] air_motion_engine || echo [FALHOU] air_motion_engine
%ADB% shell settings put system air_motion_wake_up 0 2>nul && echo [OK] air_motion_wake_up || echo [FALHOU] air_motion_wake_up
echo.

:: DESATIVAR URL MANUAL ONLINE E SUPORTE REMOTO (SAMSUNG)
:: Desativa recursos de suporte remoto da Samsung (OneUI).
echo Desativando URL manual online e suporte remoto...
%ADB% shell settings put global online_manual_url 0 2>nul && echo [OK] online_manual_url || echo [FALHOU] online_manual_url
%ADB% shell settings put system remote_control 0 2>nul && echo [OK] remote_control || echo [FALHOU] remote_control
echo.

:: MELHORAR TEMPO DE INICIALIZACAO DE APPS
:: Desativa telemetria e melhora o tempo de inicializacao de aplicativos.
echo Ajustando inicializacao de apps e telemetria...
%ADB% shell settings put global activity_starts_logging_enabled 0 2>nul && echo [OK] activity_starts_logging_enabled || echo [FALHOU] activity_starts_logging_enabled
%ADB% shell settings put secure send_action_app_error 0 2>nul && echo [OK] send_action_app_error || echo [FALHOU] send_action_app_error
%ADB% shell settings put global bixby_pregranted_permissions 0 2>nul && echo [OK] bixby_pregranted_permissions || echo [FALHOU] bixby_pregranted_permissions
%ADB% shell settings put system send_security_reports 0 2>nul && echo [OK] send_security_reports || echo [FALHOU] send_security_reports
%ADB% shell settings put system rakuten_denwa 0 2>nul && echo [OK] rakuten_denwa || echo [FALHOU] rakuten_denwa
echo.

:: MELHORAR QUALIDADE DE AUDIO
:: Ativa efeitos de audio para melhorar a qualidade sonora.
echo Ajustando qualidade de audio...
%ADB% shell settings put system tube_amp_effect 1 2>nul && echo [OK] tube_amp_effect || echo [FALHOU] tube_amp_effect
%ADB% shell settings put system k2hd_effect 1 2>nul && echo [OK] k2hd_effect || echo [FALHOU] k2hd_effect
echo.

:: ATIVAR SCHEDULER MULTICORE
:: Ativa o agendador multicore para melhorar o desempenho.
echo Ativando agendador multicore...
%ADB% shell settings put system multicore_packet_scheduler 1 2>nul && echo [OK] multicore_packet_scheduler || echo [FALHOU] multicore_packet_scheduler
echo.

:: DESATIVAR SERVICO DE OTIMIZACAO DE JOGOS (SAMSUNG GOS)
:: Desativa o Game Optimizing Service (GOS) da Samsung.
echo Desativando Game Optimizing Service (GOS)...
%ADB% shell settings put secure game_auto_temperature_control 0 2>nul && echo [OK] game_auto_temperature_control || echo [FALHOU] game_auto_temperature_control
%ADB% shell pm clear --user 0 com.samsung.android.game.gos 2>nul && echo [OK] pm clear com.samsung.android.game.gos || echo [FALHOU] pm clear com.samsung.android.game.gos
%ADB% shell settings put secure gamesdk_version 0 2>nul && echo [OK] gamesdk_version || echo [FALHOU] gamesdk_version
%ADB% shell settings put secure game_home_enable 0 2>nul && echo [OK] game_home_enable || echo [FALHOU] game_home_enable
%ADB% shell settings put secure game_bixby_block 1 2>nul && echo [OK] game_bixby_block || echo [FALHOU] game_bixby_block
echo.

:: BLOQUEAR ATUALIZACOES DE SISTEMA GALAXY
:: Bloqueia atualizacoes automaticas do sistema Galaxy (nao afeta OTA).
echo Bloqueando atualizacoes de sistema Galaxy...
%ADB% shell settings put global galaxy_system_update_block 1 2>nul && echo [OK] galaxy_system_update_block || echo [FALHOU] galaxy_system_update_block
echo.

:: AJUSTE PARA TELA OLED
:: Ativa protecao contra burn-in em telas OLED.
echo Ajustando protecao para tela OLED...
%ADB% shell settings put global burn_in_protection 1 2>nul && echo [OK] burn_in_protection || echo [FALHOU] burn_in_protection
echo.

:: MELHORAR RESPOSTA AO TOQUE
:: Reduz latencia e melhora a resposta ao toque.
echo Ajustando resposta ao toque...
%ADB% shell settings put secure tap_duration_threshold 0.0 2>nul && echo [OK] tap_duration_threshold || echo [FALHOU] tap_duration_threshold
%ADB% shell settings put secure touch_blocking_period 0.0 2>nul && echo [OK] touch_blocking_period || echo [FALHOU] touch_blocking_period
echo.

:: DESATIVAR ESCANEAMENTO EM SEGUNDO PLANO (BLUETOOTH, DISPOSITIVOS PROXIMOS)
:: Desativa escaneamento automatico de Bluetooth e dispositivos proximos.
echo Desativando escaneamento em segundo plano...
%ADB% shell settings put system nearby_scanning_permission_allowed 0 2>nul && echo [OK] nearby_scanning_permission_allowed || echo [FALHOU] nearby_scanning_permission_allowed
%ADB% shell settings put system nearby_scanning_enabled 0 2>nul && echo [OK] nearby_scanning_enabled || echo [FALHOU] nearby_scanning_enabled
%ADB% shell settings put global ble_scan_always_enabled 0 2>nul && echo [OK] ble_scan_always_enabled || echo [FALHOU] ble_scan_always_enabled
echo.

:: DESATIVAR DETECCAO DE HOTWORD (OK GOOGLE)
:: Desativa a deteccao de "Ok Google" para economizar bateria.
echo Desativando deteccao de hotword do Google...
%ADB% shell settings put global hotword_detection_enabled 0 2>nul && echo [OK] hotword_detection_enabled || echo [FALHOU] hotword_detection_enabled
echo.

:: OUTROS AJUSTES SAMSUNG
:: Desativa sincronizacao entre dispositivos Samsung e RAM Plus.
echo Outros ajustes Samsung...
%ADB% shell settings put system mcf_continuity 0 2>nul && echo [OK] mcf_continuity || echo [FALHOU] mcf_continuity
%ADB% shell settings put system mcf_continuity_permission_denied 1 2>nul && echo [OK] mcf_continuity_permission_denied || echo [FALHOU] mcf_continuity_permission_denied
%ADB% shell settings put system mcf_permission_denied 1 2>nul && echo [OK] mcf_permission_denied || echo [FALHOU] mcf_permission_denied
echo Desativando RAM Plus...
%ADB% shell settings put global ram_expand_size_list 0 2>nul && echo [OK] ram_expand_size_list || echo [FALHOU] ram_expand_size_list
%ADB% shell settings put global zram_enabled 0 2>nul && echo [OK] zram_enabled || echo [FALHOU] zram_enabled
echo.

:: ATUALIZACOES E LIMPEZA (EXIGE ROOT)
:: Estes comandos otimizam aplicativos e limpam caches, mas podem travar sem root.
:: Um timeout de 60 segundos foi adicionado para evitar travamentos.
echo Executando atualizacoes e limpeza (pode falhar sem root)...
echo AVISO: Estes comandos podem demorar ou falhar. Timeout de 60 segundos por comando.
start /B cmd /C "%ADB% shell cmd package compile -m speed-profile -a 2>nul && echo [OK] cmd package compile || echo [FALHOU] cmd package compile"
timeout /T 60 /NOBREAK >nul
start /B cmd /C "%ADB% shell cmd package bg-dexopt-job 2>nul && echo [OK] cmd package bg-dexopt-job || echo [FALHOU] cmd package bg-dexopt-job"
timeout /T 60 /NOBREAK >nul
start /B cmd /C "%ADB% shell pm trim-caches 999999999999999999 2>nul && echo [OK] pm trim-caches || echo [FALHOU] pm trim-caches"
timeout /T 60 /NOBREAK >nul
echo.

:: FINALIZAR
echo [FINALIZADO] Ajustes completos aplicados! Desconecte o cabo e reinicie o aparelho se desejar.
echo Se alguns comandos falharam, e normal, especialmente em dispositivos sem root ou com Android Go.
pause