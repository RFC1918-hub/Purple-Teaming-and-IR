function IsElevated {
    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $p = New-Object System.Security.Principal.WindowsPrincipal($id)
    if ($p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Output $true
    } else { 
        Write-Output $false 
    }   
 }

if (-not(IsElevated))  { 
    Write-Host "Please run this script as an administrator" -ForegroundColor Red
    break
}

########## AS_W_01 ##########
# Audit Success Process Creation event
Write-Host ""
Write-Host "[*] Checking auditing policy" -ForegroundColor Gray
Write-Host ""
auditpol /get /category:"Detailed Tracking" /subcategory:"Process Creation"

########## AS_W_02 ##########
# Include command line in process creation events
Write-Host ""
Write-Host "[*] Include command line in process creation events" -ForegroundColor Gray
Write-Host ""

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$Name = "ProcessCreationIncludeCmdLine_Enabled"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host ""
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

########## AS_W_03 ##########
# Turn on Module Logging
Write-Host ""
Write-Host "[*] Turn on Module Logging" -ForegroundColor Gray
Write-Host ""

Write-Host -NoNewline "ModuleLogging: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging"
$Name = "EnableModuleLogging"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

Write-Host -NoNewline "ModuleNames: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames"
$Name = "*"
$value = "*"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

########## AS_W_04 ##########
# Configure script block logging for PowerShell
Write-Host ""
Write-Host "[*] Configure script block logging for PowerShell" -ForegroundColor Gray
Write-Host ""

Write-Host -NoNewline "EnableScriptBlockLogging: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$Name = "EnableScriptBlockLogging"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

Write-Host -NoNewline "EnableScriptBlockInvocationLogging: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$Name = "EnableScriptBlockInvocationLogging"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

########## AS_W_05 ##########
# Turn on PowerShell Transcript
Write-Host ""
Write-Host "[*] Turn on PowerShell Transcript" -ForegroundColor Gray
Write-Host ""

Write-Host -NoNewline "EnableInvocationHeader: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription"
$Name = "EnableInvocationHeader"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

Write-Host -NoNewline "EnableTranscripting: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription"
$Name = "EnableTranscripting"
$value = "1"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "Enabled" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}

Write-Host -NoNewline "OutputDirectory: " -ForegroundColor White
$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription"
$Name = "OutputDirectory"
$value = "C:\pstrans\"

if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist" -ForegroundColor Red
} else {
    $registry = Get-ItemProperty -Path $registryPath
    if ($registry.$Name -eq $value) {
        Write-Host "$value" -ForegroundColor DarkGreen
    } else {
        Write-Host "Disabled" -ForegroundColor Red
    }
}