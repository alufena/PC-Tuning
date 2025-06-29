@echo off
title Installing Visual C++ Redistributable - Winget
color 1F
echo Installing Visual C++ Redistributable...

set "PARAMS=--silent --accept-package-agreements --accept-source-agreements --force"

winget install --id=Microsoft.VCRedist.2005.x86 --silent --accept-package-agreements --accept-source-agreements --override "/q"
winget install --id=Microsoft.VCRedist.2005.x64 --silent --accept-package-agreements --accept-source-agreements --override "/q"
winget install --id=Microsoft.VCRedist.2008.x86 %PARAMS%
winget install --id=Microsoft.VCRedist.2008.x64 %PARAMS%
winget install --id=Microsoft.VCRedist.2010.x86 %PARAMS%
winget install --id=Microsoft.VCRedist.2010.x64 %PARAMS%
winget install --id=Microsoft.VCRedist.2012.x86 %PARAMS%
winget install --id=Microsoft.VCRedist.2012.x64 %PARAMS%
winget install --id=Microsoft.VCRedist.2013.x86 %PARAMS%
winget install --id=Microsoft.VCRedist.2013.x64 %PARAMS%
winget install --id=Microsoft.VCRedist.2015+.x86 %PARAMS%
winget install --id=Microsoft.VCRedist.2015+.x64 %PARAMS%

exit