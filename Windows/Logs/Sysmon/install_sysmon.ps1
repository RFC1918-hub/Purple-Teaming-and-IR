
$sysmonPath = "$env:TEMP"
Set-Location $sysmonPath 

Write-Host "Downloading Sysmon.zip"
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile Sysmon.zip

Write-Host "Downloading Sysmon modular config"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/olafhartong/sysmon-modular/master/sysmonconfig.xml" -OutFile sysmonconfig.xml

Expand-Archive Sysmon.zip -DestinationPath $sysmonPath

Start-Process Sysmon64.exe -ArgumentList "-i sysmonconfig.xml -accepteula" 

