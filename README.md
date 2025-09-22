# README - Profili PowerShell e Zsh

Questo repository contiene due file di configurazione per il terminale, uno per **PowerShell** e uno per **Zsh**. Entrambi i profili sono personalizzati per migliorare l’esperienza utente e velocizzare il lavoro da terminale.

---

## Profilo Zsh (`.zshrc`)

### Descrizione
Questo file è la configurazione per la shell **Zsh**, utilizzando il framework [Oh My Zsh](https://ohmyz.sh/). È progettato per caricare un tema, plugin utili, alias personalizzati e alcune ottimizzazioni di performance.

### Caratteristiche principali:
- Impostazione del tema `robbyrussell` (o tema casuale).
- Misurazione del tempo di caricamento del profilo in millisecondi.
- Plugin abilitati: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `you-should-use`, `zsh-bat`.
- Alias personalizzati e possibilità di estendere con plugin e alias personalizzati nel percorso `$ZSH_CUSTOM`.
- Visualizzazione della versione di Zsh all’avvio.
- Esecuzione di `neofetch` per mostrare informazioni sul sistema all’avvio.
- Commenti guida su come personalizzare ulteriormente il profilo (es. variabili di ambiente, editor preferito, comportamento di aggiornamento).

### Come usare
1. Assicurati di avere Oh My Zsh installato.
2. Copia questo file come `.zshrc` nella tua home directory (`~`).
3. Riapri il terminale o esegui `source ~/.zshrc` per applicare le modifiche.

---

## Profilo PowerShell (`Microsoft.PowerShell_profile.ps1`)

### Descrizione
Questo file configura la shell **PowerShell** con alcune personalizzazioni utili per un ambiente Windows.

### Caratteristiche principali:
- Importa il modulo `Terminal-Icons` per visualizzare icone nel terminale.
- Esegue `winfetch` all’avvio per visualizzare informazioni sul sistema.
- Definisce alias personalizzati per liste di file e directory (`ll` e `la`).
- Integra l’inizializzazione di `oh-my-posh` con un tema configurato (`robbyrussell.omp.json`) per arricchire il prompt.
  
### Come usare
1. Copia questo file nel percorso del profilo PowerShell. Puoi scoprire il percorso eseguendo in PowerShell:
   ```powershell
   $PROFILE
   
