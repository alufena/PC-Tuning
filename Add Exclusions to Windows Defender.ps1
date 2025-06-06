﻿Add-MpPreference -ExclusionPath $env:LOCALAPPDATA"\Temp\NVIDIA Corporation\NV_Cache"
Add-MpPreference -ExclusionPath $env:PROGRAMDATA"\NVIDIA Corporation\NV_Cache"
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Datastore.edb"
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb*.jrs"
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb.chk"
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Tmp.edb"
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\*.log"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.edb"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.sdb"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.log"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.chk"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.jrs"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.xml"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.csv"
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.cmtx"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.pol"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.tmp"
Add-MpPreference -ExclusionPath $env:userprofile"\NTUser.dat"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.log"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.dat"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.chk"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\MetaConfig.mof"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\winevt\Logs\*.evtx"
Add-MpPreference -ExclusionPath $env:windir"\apppatch\sysmain.sdb"
Add-MpPreference -ExclusionPath $env:windir"\EventLog\Data\lastalive?.dat"
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\WPRUI.exe"
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\wpa.exe"
Add-MpPreference -ExclusionProcess "MsMpEng.exe"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\WindowsPowerShell\v1.0\Modules"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCStatusHistory.mof"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCEngineCache.mof"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCResourceStateCache.mof"
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\ConfigurationStatus"
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Common Files\Steam\SteamService.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Battle.net\World of Warcraft\_retail_\Wow.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\No Man's Sky\Binaries\NMS.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\The Witcher 3\bin\x64\witcher3.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\The Witcher 3\bin\x64_dx12\witcher3.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_BE.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_EAC_EOS.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteLauncher.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicGamesLauncher.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win32\EpicGamesLauncher.exe"
Add-MpPreference -ExclusionProcess "D:\Epic Games\GTAV\GTA5.exe"
Add-MpPreference -ExclusionProcess "D:\Epic Games\GTAV\PlayGTAV.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Cities_Skylines\Cities.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Grand Theft Auto IV\GTAIV\GTAIV.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\POSTAL 4\Postal4.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\POSTAL 4\Postal4\Binaries\Win64\Postal4-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\bin\win64\cs2.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\quakechampions\client\bin\pc\QuakeChampions.exe"
Add-MpPreference -ExclusionProcess "F:\Forza Horizon 5\forzahorizon5.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\American Truck Simulator\bin\win_x64\amtrucks.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Team Fortress 2\hl2.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Warframe\Warframe.x64.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\World of Warships\bin\8517795\bin64\WorldOfWarships64.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Crysis\Bin32\Crysis.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Crysis\Bin32\Crysis64.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Dying Light\DyingLightGame.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Ghostrunner\Ghostrunner\Binaries\Win64\Ghostrunner-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Left 4 Dead 2\left4dead2.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Dead by Daylight\DeadByDaylight\Binaries\Win64\DeadByDaylight-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Destroy All Humans!\DH\Binaries\Win64\DH-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\L.A.Noire\LANoire.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Dishonored\Binaries\Win32\Dishonored.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\killingfloor2\Binaries\Win64\KFGame.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\New World\Bin64\NewWorld.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\New World\NewWorldLauncher.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\Call of Duty HQ\cod.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Halo Infinite\HaloInfinite.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Overwatch\Overwatch.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Lost Ark\Binaries\Win64\LOSTARK.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\World of Tanks\na\win64\WorldOfTanks.exe"
Add-MpPreference -ExclusionProcess "C:\ProgramData\Wargaming.net\GameCenter for Steam\wgc.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Paladins\Binaries\Win64\Paladins.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Carmageddon Max Damage\bin\Carmageddon_Max_Damage.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Raft\Raft.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Bloodhunt\Tiger\Binaries\Win64\Tiger-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Mass Effect\Binaries\MassEffect.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\House Flipper\HouseFlipper.exe"
Add-MpPreference -ExclusionProcess "F:\The Last of Us Part I\tlou-i.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\The Sims 4\Game\Bin\TS4_x64.exe"
Add-MpPreference -ExclusionProcess "F:\Cyberpunk 2077\bin\x64\Cyberpunk2077.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\Red Dead Redemption 2\RDR2.exe"
Add-MpPreference -ExclusionProcess "F:\Tropico 6\Tropico6.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Gas Station Simulator\GSS2\Binaries\Win64\GSS2-Win64-Shipping.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Planet Coaster\PlanetCoaster.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Mad Max\MadMax.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\BorderlandsGOTYEnhanced\Binaries\Win64\BorderlandsGOTY.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\VRising\VRising.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\TPH\TPH.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\bin\win64\dota2.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Skyrim Special Edition\SkyrimSE.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files\Topaz Labs LLC\Topaz Video AI\Topaz Video AI.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Topaz Video AI\App\Topaz Video AI.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files\Topaz Labs LLC\Topaz Video AI\ffmpeg.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Topaz Video AI\App\ffmpeg.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Battlefield 1\bf1.exe"
Add-MpPreference -ExclusionProcess "F:\Dying Light 2 Stay Human\ph\work\bin\x64\DyingLightGame_x64_rwdi.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Fallout 4\Fallout4.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\NARAKA BLADEPOINT\NarakaBladepoint.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Fallout76\Fallout76.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Guild Wars 2\Gw2-64.exe"
Add-MpPreference -ExclusionProcess "E:\Starfield\Starfield.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Sid Meier's Civilization VI\Base\Binaries\Win64Steam\CivilizationVI_DX12.exe"
Add-MpPreference -ExclusionProcess "F:\Forza Motorsport\forza_gaming.desktop.x64_release_final.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Crossout\bin\win64\Crossout.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\Battlefield 2042\BF2042.exe"
Add-MpPreference -ExclusionProcess "F:\Alan Wake 2\AlanWake2.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\The Finals\Discovery.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Resident Evil Village BIOHAZARD VILLAGE\re8.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Mass Effect Legendary Edition\Game\ME1\Binaries\Win64\MassEffect1.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\Battle.net\World of Warcraft\_classic_\WowClassic.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\Wolfenstein.The.New.Order.exe"
Add-MpPreference -ExclusionProcess "E:\SteamLibrary\steamapps\common\AoE3DE\AoE3DE_s.exe"
Add-MpPreference -ExclusionProcess "D:\SteamLibrary\steamapps\common\Excalibur\NeedForSpeedUnbound.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\Apex Legends\r5apex.exe"
Add-MpPreference -ExclusionProcess "G:\SteamLibrary\steamapps\common\Apex Legends\r5apex_dx12.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Sons Of The Forest\SonsOfTheForest.exe"
Add-MpPreference -ExclusionProcess "F:\SteamLibrary\steamapps\common\Back 4 Blood\Gobi\Binaries\Win64\Back4Blood.exe"
Add-MpPreference -ExclusionProcess "C:\Program Files (x86)\MAXIS\The Sims\Sims.exe"
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Steam"
Add-MpPreference -ExclusionPath "D:\Epic Games"
Add-MpPreference -ExclusionPath "D:\SteamLibrary"
Add-MpPreference -ExclusionPath "E:\SteamLibrary"
Add-MpPreference -ExclusionPath "F:\SteamLibrary"
Add-MpPreference -ExclusionPath "G:\SteamLibrary"
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Battle.net"
Add-MpPreference -ExclusionPath "C:\Program Files (x86)\Epic Games"