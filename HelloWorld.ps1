$RebootNeeded = $false

try {
    Get-HPBiosVersion
    Write-Output "HP Module Installed"
    }
catch {
    Write-Output "HP Module Not Loaded, Loading.... Now"
    if (-not (Test-Path $DownloadDir)){New-Item $DownloadDir -ItemType Directory}
    Start-Process -FilePath "$($DownloadDir)\HPCM.exe" -ArgumentList "/VERYSILENT /LOG=$($DownloadDir)\InstallLog.log" -Wait
    Write-Output "Finished Downloading and Installing HP Module"
    }
