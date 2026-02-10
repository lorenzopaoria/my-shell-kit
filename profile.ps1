oh-my-posh init pwsh --config "$HOME\oh-my-posh\robbyrussell.omp.json" | Invoke-Expression

# Modulo per icone nel terminale
Import-Module Terminal-Icons

# winfetch solo al primo avvio per sessione (una volta per boot)
$flag = "$env:TEMP\.winfetch_ran"
$bootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime.ToString("o")
$storedTime = if (Test-Path $flag) { (Get-Content $flag -Raw -ErrorAction SilentlyContinue) -replace '\s' } else { '' }

if ($storedTime -ne $bootTime) {
    winfetch
    $bootTime | Out-File -FilePath $flag -Force
}


# Alias personalizzati
Set-Alias ll 'Get-ChildItem -Force'
Set-Alias la 'Get-ChildItem -Force -Recurse'

