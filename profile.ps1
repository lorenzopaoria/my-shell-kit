oh-my-posh init pwsh --config "$HOME\oh-my-posh\robbyrussell.omp.json" | Invoke-Expression

# Modulo per icone nel terminale
Import-Module Terminal-Icons

# winfetch solo al primo avvio
$flag = "$env:USERPROFILE\.winfetch_ran"

if (-Not (Test-Path $flag)) {
    winfetch
    New-Item -ItemType File -Path $flag | Out-Null
}


# Alias personalizzati
Set-Alias ll 'Get-ChildItem -Force'
Set-Alias la 'Get-ChildItem -Force -Recurse'

