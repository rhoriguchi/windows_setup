If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -Verb RunAs
  Exit
}

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y composer
choco install -y git.install
choco install -y jdk11
choco install -y maven
choco install -y miktex
choco install -y nodejs.install
choco install -y python3
choco install -y strawberryperl

Write-Output "`nPress any key to continue..."
[Console]::ReadKey($true) | Out-Null
