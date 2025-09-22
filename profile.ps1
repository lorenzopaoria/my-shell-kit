oh-my-posh init pwsh --config "$HOME\oh-my-posh\robbyrussell.omp.json" | Invoke-Expression

# Modulo per icone nel terminale
Import-Module Terminal-Icons

# neofetch all'avvio
winfetch

# Alias personalizzati
Set-Alias ll 'Get-ChildItem -Force'
Set-Alias la 'Get-ChildItem -Force -Recurse'

