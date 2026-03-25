# My Shell Kit

Raccolta di file di configurazione per personalizzare **Zsh** e **PowerShell** (pensata per **Windows Terminal** e per lavorare sia su **Fedora** che su **Windows/WSL**).

## Contesto / Target
- **Windows Terminal** come terminal principale
- **PowerShell** per l’ambiente Windows
- **Zsh** per l’ambiente Linux (Fedora / WSL)

---

## Struttura della repository

```text
.
├── fedora/
│   ├── .zshrc                  # Profilo Zsh per Fedora
│   ├── .ripristina-batteria.sh  # Script utility (Fedora)
│   └── new.txt                  # File di test
├── windows/
│   ├── .zshrc                   # Profilo Zsh per Windows/WSL
│   ├── profile.ps1              # Profilo PowerShell
│   └── settings_terminal.json   # Config di Windows Terminal (esempio)
└── README.md
```

---

## Zsh

### Profili disponibili
- `fedora/.zshrc` → profilo per Fedora (Linux nativo)
- `windows/.zshrc` → profilo per Windows/WSL (Debian) / setup “ibridi”

### Feature comuni (possono variare in base al profilo)
- Basato su **Oh My Zsh**
- Plugin tipici: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `you-should-use`, `zsh-bat`
- Misurazione del tempo di caricamento
- “Fetch” una sola volta per boot (es. `fastfetch`), tramite file flag in `/tmp`

### Installazione rapida
1. Installa **Oh My Zsh**
2. Scegli il profilo:
   - Fedora: `fedora/.zshrc`
   - Windows/WSL: `windows/.zshrc`
3. Copia o crea un symlink su `~/.zshrc`:

```bash
# esempio (copia)
cp fedora/.zshrc ~/.zshrc

# esempio (symlink)
ln -sf "$(pwd)/fedora/.zshrc" ~/.zshrc
```

4. Installa i plugin (se non già presenti):

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
```

---

## PowerShell (`windows/profile.ps1`)

### Feature
- Inizializzazione prompt (es. **Oh My Posh**)
- `Terminal-Icons`
- “Fetch” una sola volta per boot (es. `winfetch`) tramite file flag in `%TEMP%`
- Alias utili (`ll`, `la`, …)

### Installazione rapida
1. Installa i prerequisiti:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Script -Name winfetch
```

2. Trova il path del tuo profilo:

```powershell
$PROFILE
```

3. Copia il contenuto di `windows/profile.ps1` nel profilo PowerShell.

---

## Windows Terminal (`windows/settings_terminal.json`)
File di esempio con font Nerd Font / colori / impostazioni consigliate per una resa corretta di icone e temi.

---

## Requisiti

### Zsh
- Zsh
- Oh My Zsh
- Git
- `fastfetch` (opzionale)
- Nerd Font (consigliato)

### PowerShell
- PowerShell 5.1+ (consigliato PowerShell 7+)
- Oh My Posh
- Terminal-Icons
- `winfetch` (opzionale)
- Nerd Font (necessario per icone)

### Windows Terminal
- Windows Terminal
- Nerd Font installato

---

## Contributing
Fork e personalizza liberamente. PR e suggerimenti sono benvenuti.

## License
File forniti “as-is” per uso personale e personalizzazione.