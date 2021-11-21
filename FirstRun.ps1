$USBName = "WinInstaller"
$USBDriveLetter = $(Get-CimInstance -class Win32_LogicalDisk | Where-Object { $_.VolumeName -eq $USBName }).DeviceID
$InstallScript = "$USBDriveLetter\D3\Install.ps1"


if ($InstallScript){
    Start-Process "Powershell" -Wait -NoNewWindow -ArgumentList "-Executionpolicy Bypass -File $InstallScript"
}

Restart-Computer
