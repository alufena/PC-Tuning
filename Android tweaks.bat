@echo off
cd /d "%~dp0"

:: ADB PATH
:: Change this path if ADB is located elsewhere on your computer.
:: Example: set ADB="C:\Path\To\Your\adb.exe"
set ADB="C:\Program Files (x86)\Scrcpy\adb.exe"

:: INITIAL MESSAGE
echo STARTING THE MELODY SCRIPT FOR ANDROID...
echo This script applies optimizations for Android 7.1.1 or higher devices.
echo For Samsung, Android 9+ with OneUI is recommended.
echo.

:: STEP 1: CHECK IF ADB EXISTS
echo [STEP 1] Checking for ADB...
if exist %ADB% (
    echo ADB found at %ADB%
) else (
    echo ERROR: ADB not found at %ADB%. Verify the path and try again.
    pause
    exit /b
)

:: STEP 2: CHECK CONNECTED DEVICES
echo [STEP 2] Checking connected devices...
%ADB% devices
echo Ensure your device is listed above with the status 'device'.
echo.

:: STEP 3: START ADJUSTMENTS
echo [STEP 3] Applying Melody Script adjustments...
echo.

:: VISUAL IMPROVEMENTS
:: Disables blur effects and animations to improve visual fluidity.
:: Refresh rate commands (48Hz) are commented; uncomment to enable.
echo Adjusting animations and transparencies...
%ADB% shell settings put global accessibility_reduce_transparency 1 2>nul && echo [OK] accessibility_reduce_transparency || echo [FAILED] accessibility_reduce_transparency
%ADB% shell settings put global disable_window_blurs 1 2>nul && echo [OK] disable_window_blurs || echo [FAILED] disable_window_blurs
%ADB% shell settings put global window_animation_scale 0.0 2>nul && echo [OK] window_animation_scale || echo [FAILED] window_animation_scale
%ADB% shell settings put global transition_animation_scale 0.0 2>nul && echo [OK] transition_animation_scale || echo [FAILED] transition_animation_scale
%ADB% shell settings put global animator_duration_scale 0.0 2>nul && echo [OK] animator_duration_scale || echo [FAILED] animator_duration_scale
%ADB% shell settings put system screen_auto_brightness_adj 1.0 2>nul && echo [OK] screen_auto_brightness_adj || echo [FAILED] screen_auto_brightness_adj
:: Uncomment the next two lines to set the refresh rate to 48Hz (may not work on older devices).
%ADB% shell settings put system peak_refresh_rate 48.0 2>nul && echo [OK] peak_refresh_rate || echo [FAILED] peak_refresh_rate
%ADB% shell settings put system min_refresh_rate 1.0 2>nul && echo [OK] min_refresh_rate || echo [FAILED] min_refresh_rate
:: Uncomment the next two lines to revert the refresh rate to the device default (usually 60Hz).
:: %ADB% shell settings put system peak_refresh_rate 60.0 2>nul && echo [OK] peak_refresh_rate reverted || echo [FAILED] peak_refresh_rate reverted
:: %ADB% shell settings put system min_refresh_rate 60.0 2>nul && echo [OK] min_refresh_rate reverted || echo [FAILED] min_refresh_rate reverted
echo.

:: NETWORK IMPROVEMENTS
:: Optimizes mobile data and Wi-Fi connection, disables Wi-Fi power saving,
:: enables mobile data on boot, and configures DNS to block ads.
echo Adjusting network settings...
%ADB% shell settings put global network_recommendations_enabled 0 2>nul && echo [OK] network_recommendations_enabled || echo [FAILED] network_recommendations_enabled
%ADB% shell settings put global network_scoring_ui_enabled 0 2>nul && echo [OK] network_scoring_ui_enabled || echo [FAILED] network_scoring_ui_enabled
%ADB% shell settings put global tether_offload_disabled 0 2>nul && echo [OK] tether_offload_disabled || echo [FAILED] tether_offload_disabled
%ADB% shell settings put global wifi_power_save 0 2>nul && echo [OK] wifi_power_save || echo [FAILED] wifi_power_save
%ADB% shell settings put global enable_cellular_on_boot 1 2>nul && echo [OK] enable_cellular_on_boot || echo [FAILED] enable_cellular_on_boot
%ADB% shell settings put global mobile_data_always_on 0 2>nul && echo [OK] mobile_data_always_on || echo [FAILED] mobile_data_always_on
%ADB% shell settings put global ble_scan_always_enabled 0 2>nul && echo [OK] ble_scan_always_enabled || echo [FAILED] ble_scan_always_enabled
%ADB% shell settings put global private_dns_specifier dns.adguard.com 2>nul && echo [OK] private_dns_specifier || echo [FAILED] private_dns_specifier
%ADB% shell settings put global preferred_network_mode 9,9 2>nul && echo [OK] preferred_network_mode || echo [FAILED] preferred_network_mode
:: Configure DNS (using dns.adguard.com IPs for Android 8.1.0 compatibility)
:: Note: These commands may not work on Android 8.1.0; use the DNS Changer app to set dns.adguard.com.
%ADB% shell settings put global wifi_dns1 "94.140.14.14" 2>nul && echo [OK] wifi_dns1 || echo [FAILED] wifi_dns1
%ADB% shell settings put global wifi_dns2 "94.140.15.15" 2>nul && echo [OK] wifi_dns2 || echo [FAILED] wifi_dns2
%ADB% shell settings put global mobile_data_dns1 "94.140.14.14" 2>nul && echo [OK] mobile_data_dns1 || echo [FAILED] mobile_data_dns1
%ADB% shell settings put global mobile_data_dns2 "94.140.15.15" 2>nul && echo [OK] mobile_data_dns2 || echo [FAILED] mobile_data_dns2
echo.

:: POWER MANAGEMENT
:: Disables adaptive sleep and power-saving algorithms to improve
:: performance and avoid notification delays.
echo Adjusting power management...
%ADB% shell settings put global sem_enhanced_cpu_responsiveness 0 2>nul && echo [OK] sem_enhanced_cpu_responsiveness || echo [FAILED] sem_enhanced_cpu_responsiveness
%ADB% shell settings put global enhanced_processing 0 2>nul && echo [OK] enhanced_processing || echo [FAILED] enhanced_processing
%ADB% shell settings put global app_standby_enabled 0 2>nul && echo [OK] app_standby_enabled || echo [FAILED] app_standby_enabled
%ADB% shell settings put global adaptive_battery_management_enabled 0 2>nul && echo [OK] adaptive_battery_management_enabled || echo [FAILED] adaptive_battery_management_enabled
%ADB% shell settings put global app_restriction_enabled true 2>nul && echo [OK] app_restriction_enabled || echo [FAILED] app_restriction_enabled
%ADB% shell settings put system intelligent_sleep_mode 0 2>nul && echo [OK] intelligent_sleep_mode || echo [FAILED] intelligent_sleep_mode
%ADB% shell settings put secure adaptive_sleep 0 2>nul && echo [OK] adaptive_sleep || echo [FAILED] adaptive_sleep
%ADB% shell settings put global automatic_power_save_mode 0 2>nul && echo [OK] automatic_power_save_mode || echo [FAILED] automatic_power_save_mode
%ADB% shell settings put global low_power 0 2>nul && echo [OK] low_power || echo [FAILED] low_power
%ADB% shell settings put global dynamic_power_savings_enabled 0 2>nul && echo [OK] dynamic_power_savings_enabled || echo [FAILED] dynamic_power_savings_enabled
%ADB% shell settings put global dynamic_power_savings_disable_threshold 20 2>nul && echo [OK] dynamic_power_savings_disable_threshold || echo [FAILED] dynamic_power_savings_disable_threshold
echo.

:: BATTERY SAVING (SCREENSAVER)
:: Disables the screensaver to save battery.
echo Disabling screensaver...
%ADB% shell settings put secure screensaver_enabled 0 2>nul && echo [OK] screensaver_enabled || echo [FAILED] screensaver_enabled
%ADB% shell settings put secure screensaver_activate_on_sleep 0 2>nul && echo [OK] screensaver_activate_on_sleep || echo [FAILED] screensaver_activate_on_sleep
%ADB% shell settings put secure screensaver_activate_on_dock 0 2>nul && echo [OK] screensaver_activate_on_dock || echo [FAILED] screensaver_activate_on_dock
echo.

:: SYSTEM RESPONSE
:: Reduces the time required for long presses, improving responsiveness.
echo Adjusting system response...
%ADB% shell settings put secure long_press_timeout 250 2>nul && echo [OK] long_press_timeout || echo [FAILED] long_press_timeout
%ADB% shell settings put secure multi_press_timeout 250 2>nul && echo [OK] multi_press_timeout || echo [FAILED] multi_press_timeout
echo.

:: CALL ADJUSTMENTS
:: Enables extra volume and noise reduction for calls, disables vibrations.
echo Adjusting call settings...
%ADB% shell settings put system call_extra_volume 1 2>nul && echo [OK] call_extra_volume || echo [FAILED] call_extra_volume
%ADB% shell settings put system call_noise_reduction 1 2>nul && echo [OK] call_noise_reduction || echo [FAILED] call_noise_reduction
%ADB% shell settings put system call_answer_vib 0 2>nul && echo [OK] call_answer_vib || echo [FAILED] call_answer_vib
%ADB% shell settings put system call_end_vib 0 2>nul && echo [OK] call_end_vib || echo [FAILED] call_end_vib
%ADB% shell settings put global swipe_to_call_message 0 2>nul && echo [OK] swipe_to_call_message || echo [FAILED] swipe_to_call_message
echo.

:: CHANGE DEVICE NAME
:: Changes the device name (Bluetooth and system) to "Cellphone".
echo Changing device name...
%ADB% shell settings put secure bluetooth_name "Celular" 2>nul && echo [OK] bluetooth_name || echo [FAILED] bluetooth_name
%ADB% shell settings put global device_name "Celular" 2>nul && echo [OK] device_name || echo [FAILED] device_name
%ADB% shell settings put global synced_account_name "Celular" 2>nul && echo [OK] synced_account_name || echo [FAILED] synced_account_name
echo.

:: SOUND AND VIBRATIONS
:: Disables unnecessary sounds and vibrations, enables vibration sync with ringtone.
echo Adjusting sound and vibrations...
%ADB% shell settings put system navigation_gestures_vibrate 0 2>nul && echo [OK] navigation_gestures_vibrate || echo [FAILED] navigation_gestures_vibrate
%ADB% shell settings put system lockscreen_sounds_enabled 0 2>nul && echo [OK] lockscreen_sounds_enabled || echo [FAILED] lockscreen_sounds_enabled
%ADB% shell settings put system camera_feedback_vibrate 0 2>nul && echo [OK] camera_feedback_vibrate || echo [FAILED] camera_feedback_vibrate
%ADB% shell settings put system sound_effects_enabled 0 2>nul && echo [OK] sound_effects_enabled || echo [FAILED] sound_effects_enabled
%ADB% shell settings put system sync_vibration_with_ringtone 1 2>nul && echo [OK] sync_vibration_with_ringtone || echo [FAILED] sync_vibration_with_ringtone
%ADB% shell settings put system sync_vibration_with_ringtone_2 1 2>nul && echo [OK] sync_vibration_with_ringtone_2 || echo [FAILED] sync_vibration_with_ringtone_2
%ADB% shell settings put system sync_vibration_with_notification 1 2>nul && echo [OK] sync_vibration_with_notification || echo [FAILED] sync_vibration_with_notification
%ADB% shell settings put system haptic_feedback_enabled 0 2>nul && echo [OK] haptic_feedback_enabled || echo [FAILED] haptic_feedback_enabled
%ADB% shell settings put system SEM_VIBRATION_FORCE_TOUCH_INTENSITY 0 2>nul && echo [OK] SEM_VIBRATION_FORCE_TOUCH_INTENSITY || echo [FAILED] SEM_VIBRATION_FORCE_TOUCH_INTENSITY
%ADB% shell settings put system SEM_VIBRATION_NOTIFICATION_INTENSITY 0 2>nul && echo [OK] SEM_VIBRATION_NOTIFICATION_INTENSITY || echo [FAILED] SEM_VIBRATION_NOTIFICATION_INTENSITY
%ADB% shell settings put system SEM_VIBRATION_RING_INTENSITY 5 2>nul && echo [OK] SEM_VIBRATION_RING_INTENSITY || echo [FAILED] SEM_VIBRATION_RING_INTENSITY
%ADB% shell settings put system vibrate_when_ringing 0 2>nul && echo [OK] vibrate_when_ringing || echo [FAILED] vibrate_when_ringing
%ADB% shell settings put system vibration_sound_enabled 0 2>nul && echo [OK] vibration_sound_enabled || echo [FAILED] vibration_sound_enabled
%ADB% shell settings put system VIB_FEEDBACK_MAGNITUDE 0 2>nul && echo [OK] VIB_FEEDBACK_MAGNITUDE || echo [FAILED] VIB_FEEDBACK_MAGNITUDE
%ADB% shell settings put system VIB_RECVCALL_MAGNITUDE 0 2>nul && echo [OK] VIB_RECVCALL_MAGNITUDE || echo [FAILED] VIB_RECVCALL_MAGNITUDE
echo.

:: POWER AND CHARGING SOUNDS
:: Disables power and charging-related sounds and vibrations.
echo Adjusting power and charging sounds...
%ADB% shell settings put global power_sounds_enabled 0 2>nul && echo [OK] power_sounds_enabled || echo [FAILED] power_sounds_enabled
%ADB% shell settings put secure charging_vibration_enabled 0 2>nul && echo [OK] charging_vibration_enabled || echo [FAILED] charging_vibration_enabled
%ADB% shell settings put secure charging_sounds_enabled 0 2>nul && echo [OK] charging_sounds_enabled || echo [FAILED] charging_sounds_enabled
%ADB% shell settings put secure adaptive_charging_enabled 0 2>nul && echo [OK] adaptive_charging_enabled || echo [FAILED] adaptive_charging_enabled
echo.

:: BLUETOOTH AUDIO CODECS
:: Enables high-quality audio codecs for Bluetooth.
echo Adjusting Bluetooth audio codecs...
%ADB% shell settings put secure bluetooth_a2dp_bt_uhq_state 1 2>nul && echo [OK] bluetooth_a2dp_bt_uhq_state || echo [FAILED] bluetooth_a2dp_bt_uhq_state
%ADB% shell settings put secure bluetooth_a2dp_uhqa_support 1 2>nul && echo [OK] bluetooth_a2dp_uhqa_support || echo [FAILED] bluetooth_a2dp_uhqa_support
echo.

:: GOOGLE ADJUSTMENTS
:: Disables Google features to save battery and improve privacy.
echo Disabling Google features...
%ADB% shell settings put system gearhead:driving_mode_settings_enabled 0 2>nul && echo [OK] gearhead:driving_mode_settings_enabled || echo [FAILED] gearhead:driving_mode_settings_enabled
%ADB% shell settings put secure assistant 0 2>nul && echo [OK] assistant || echo [FAILED] assistant
%ADB% shell settings put secure smartspace 0 2>nul && echo [OK] smartspace || echo [FAILED] smartspace
%ADB% shell settings put global google_core_control 0 2>nul && echo [OK] google_core_control || echo [FAILED] google_core_control
%ADB% shell settings put secure adaptive_connectivity_enabled 0 2>nul && echo [OK] adaptive_connectivity_enabled || echo [FAILED] adaptive_connectivity_enabled
%ADB% shell settings put secure systemui.google.opa_enabled 0 2>nul && echo [OK] systemui.google.opa_enabled || echo [FAILED] systemui.google.opa_enabled
echo.

:: DISABLE MOTION SENSORS
:: Disables motion sensors to save battery.
echo Disabling motion sensors...
%ADB% shell settings put system master_motion 0 2>nul && echo [OK] master_motion || echo [FAILED] master_motion
%ADB% shell settings put system motion_engine 0 2>nul && echo [OK] motion_engine || echo [FAILED] motion_engine
%ADB% shell settings put system air_motion_engine 0 2>nul && echo [OK] air_motion_engine || echo [FAILED] air_motion_engine
%ADB% shell settings put system air_motion_wake_up 0 2>nul && echo [OK] air_motion_wake_up || echo [FAILED] air_motion_wake_up
echo.

:: DISABLE ONLINE MANUAL URL AND REMOTE SUPPORT (SAMSUNG)
:: Disables Samsung's remote support features (OneUI).
echo Disabling online manual URL and remote support...
%ADB% shell settings put global online_manual_url 0 2>nul && echo [OK] online_manual_url || echo [FAILED] online_manual_url
%ADB% shell settings put system remote_control 0 2>nul && echo [OK] remote_control || echo [FAILED] remote_control
echo.

:: IMPROVE APP STARTUP TIME
:: Disables telemetry and improves app startup time.
echo Adjusting app startup and telemetry...
%ADB% shell settings put global activity_starts_logging_enabled 0 2>nul && echo [OK] activity_starts_logging_enabled || echo [FAILED] activity_starts_logging_enabled
%ADB% shell settings put secure send_action_app_error 0 2>nul && echo [OK] send_action_app_error || echo [FAILED] send_action_app_error
%ADB% shell settings put global bixby_pregranted_permissions 0 2>nul && echo [OK] bixby_pregranted_permissions || echo [FAILED] bixby_pregranted_permissions
%ADB% shell settings put system send_security_reports 0 2>nul && echo [OK] send_security_reports || echo [FAILED] send_security_reports
%ADB% shell settings put system rakuten_denwa 0 2>nul && echo [OK] rakuten_denwa || echo [FAILED] rakuten_denwa
echo.

:: IMPROVE AUDIO QUALITY
:: Enables audio effects to improve sound quality.
echo Adjusting audio quality...
%ADB% shell settings put system tube_amp_effect 1 2>nul && echo [OK] tube_amp_effect || echo [FAILED] tube_amp_effect
%ADB% shell settings put system k2hd_effect 1 2>nul && echo [OK] k2hd_effect || echo [FAILED] k2hd_effect
echo.

:: ENABLE MULTICORE SCHEDULER
:: Enables the multicore scheduler to improve performance.
echo Enabling multicore scheduler...
%ADB% shell settings put system multicore_packet_scheduler 1 2>nul && echo [OK] multicore_packet_scheduler || echo [FAILED] multicore_packet_scheduler
echo.

:: DISABLE GAME OPTIMIZING SERVICE (SAMSUNG GOS)
:: Disables Samsung's Game Optimizing Service (GOS).
echo Disabling Game Optimizing Service (GOS)...
%ADB% shell settings put secure game_auto_temperature_control 0 2>nul && echo [OK] game_auto_temperature_control || echo [FAILED] game_auto_temperature_control
%ADB% shell pm clear --user 0 com.samsung.android.game.gos 2>nul && echo [OK] pm clear com.samsung.android.game.gos || echo [FAILED] pm clear com.samsung.android.game.gos
%ADB% shell settings put secure gamesdk_version 0 2>nul && echo [OK] gamesdk_version || echo [FAILED] gamesdk_version
%ADB% shell settings put secure game_home_enable 0 2>nul && echo [OK] game_home_enable || echo [FAILED] game_home_enable
%ADB% shell settings put secure game_bixby_block 1 2>nul && echo [OK] game_bixby_block || echo [FAILED] game_bixby_block
echo.

:: BLOCK GALAXY SYSTEM UPDATES
:: Blocks automatic Galaxy system updates (does not affect OTA).
echo Blocking Galaxy system updates...
%ADB% shell settings put global galaxy_system_update_block 1 2>nul && echo [OK] galaxy_system_update_block || echo [FAILED] galaxy_system_update_block
echo.

:: OLED SCREEN ADJUSTMENT
:: Enables burn-in protection for OLED screens.
echo Adjusting OLED screen protection...
%ADB% shell settings put global burn_in_protection 1 2>nul && echo [OK] burn_in_protection || echo [FAILED] burn_in_protection
echo.

:: IMPROVE TOUCH RESPONSE
:: Reduces latency and improves touch response.
echo Adjusting touch response...
%ADB% shell settings put secure tap_duration_threshold 0.0 2>nul && echo [OK] tap_duration_threshold || echo [FAILED] tap_duration_threshold
%ADB% shell settings put secure touch_blocking_period 0.0 2>nul && echo [OK] touch_blocking_period || echo [FAILED] touch_blocking_period
echo.

:: DISABLE BACKGROUND SCANNING (BLUETOOTH, NEARBY DEVICES)
:: Disables automatic Bluetooth and nearby device scanning.
echo Disabling background scanning...
%ADB% shell settings put system nearby_scanning_permission_allowed 0 2>nul && echo [OK] nearby_scanning_permission_allowed || echo [FAILED] nearby_scanning_permission_allowed
%ADB% shell settings put system nearby_scanning_enabled 0 2>nul && echo [OK] nearby_scanning_enabled || echo [FAILED] nearby_scanning_enabled
%ADB% shell settings put global ble_scan_always_enabled 0 2>nul && echo [OK] ble_scan_always_enabled || echo [FAILED] ble_scan_always_enabled
echo.

:: DISABLE HOTWORD DETECTION (OK GOOGLE)
:: Disables "Ok Google" detection to save battery.
echo Disabling Google hotword detection...
%ADB% shell settings put global hotword_detection_enabled 0 2>nul && echo [OK] hotword_detection_enabled || echo [FAILED] hotword_detection_enabled
echo.

:: OTHER SAMSUNG ADJUSTMENTS
:: Disables synchronization between Samsung devices and RAM Plus.
echo Other Samsung adjustments...
%ADB% shell settings put system mcf_continuity 0 2>nul && echo [OK] mcf_continuity || echo [FAILED] mcf_continuity
%ADB% shell settings put system mcf_continuity_permission_denied 1 2>nul && echo [OK] mcf_continuity_permission_denied || echo [FAILED] mcf_continuity_permission_denied
%ADB% shell settings put system mcf_permission_denied 1 2>nul && echo [OK] mcf_permission_denied || echo [FAILED] mcf_permission_denied
echo Disabling RAM Plus...
%ADB% shell settings put global ram_expand_size_list 0 2>nul && echo [OK] ram_expand_size_list || echo [FAILED] ram_expand_size_list
%ADB% shell settings put global zram_enabled 0 2>nul && echo [OK] zram_enabled || echo [FAILED] zram_enabled
echo.

:: UPDATES AND CLEANUP (REQUIRES ROOT)
:: These commands optimize apps and clear caches, but may fail without root.
:: A 60-second timeout was added to prevent freezes.
echo Performing updates and cleanup (may fail without root)...
echo WARNING: These commands may take time or fail. 60-second timeout per command.
start /B cmd /C "%ADB% shell cmd package compile -m speed-profile -a 2>nul && echo [OK] cmd package compile || echo [FAILED] cmd package compile"
timeout /T 60 /NOBREAK >nul
start /B cmd /C "%ADB% shell cmd package bg-dexopt-job 2>nul && echo [OK] cmd package bg-dexopt-job || echo [FAILED] cmd package bg-dexopt-job"
timeout /T 60 /NOBREAK >nul
start /B cmd /C "%ADB% shell pm trim-caches 999999999999999999 2>nul && echo [OK] pm trim-caches || echo [FAILED] pm trim-caches"
timeout /T 60 /NOBREAK >nul
echo.

:: FINISH
echo [FINISHED] Adjustments successfully applied! Disconnect the cable and restart the device if desired.
echo If some commands failed, this is normal, especially on devices without root or with Android Go.
pause
