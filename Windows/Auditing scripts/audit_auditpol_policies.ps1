if (-Not ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32    -544")) {
    Write-Host "Not running as Administrator!!"
    return    
}

Write-Host "-----------------------------------------------------"
Write-Host "[*] Checking auditing policy" -ForegroundColor Green
Write-Host "-----------------------------------------------------"
Write-Host ""

Write-Host "[*] Checking Account Logon" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'Account Logon' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking Account Management" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'Account Management' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking Detailed Tracking" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'Detailed Tracking' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking DS Access" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'DS Access' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking Logon/Logoff" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'Logon/Logoff' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking Policy Change" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'Policy Change' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}

Write-Host "[*] Checking System" -ForegroundColor Green
Write-Host "-----------------------------------------------------"

auditpol /get /category:'System' /r | ConvertFrom-Csv | Format-Table -AutoSize 'Subcategory', @{
    Label      = 'Inclusion Setting'
    Expression = {
        switch ($_.'Inclusion Setting') {
            'No Auditing' { $color = "5;31"; break }
            'Success and Failure' { $color = '32'; break }
            'Success' { $color = "33"; break }
            default { $color = "0" }
        }
        $e = [char]27
        "$e[${color}m$($_.'Inclusion Setting')${e}[0m"
    }
}