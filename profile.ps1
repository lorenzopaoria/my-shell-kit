oh-my-posh init pwsh --config "$HOME\oh-my-posh\robbyrussell.omp.json" | Invoke-Expression

# Modulo per icone nel terminale
Import-Module Terminal-Icons

# winfetch solo al primo avvio per sessione (una volta per boot)
$flag = "$env:TEMP\.winfetch_ran"
$bootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime

if (-Not (Test-Path $flag) -or (Get-Item $flag).LastWriteTime -lt $bootTime) {
    winfetch
    New-Item -ItemType File -Path $flag -Force | Out-Null
}


# Alias personalizzati
Set-Alias ll 'Get-ChildItem -Force'
Set-Alias la 'Get-ChildItem -Force -Recurse'

