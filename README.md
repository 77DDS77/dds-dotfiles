# SOFTWARE DA INSTALLARE
- neofetch
- git
- neovim (possibilmente v0.10.x)
- grep
- ripgrep
- node o nvm
- luarocks (serve a nvim)
- curl

# STOW NAMING CONVENTION

Se voglio ad esempio salvare su stow i file di configurazione di neovim, 
che di solito stanno sotto .config/nvim allora creo una directory nvim (configurazione che 
voglio salvare) con dentro sostanzialmente il path dove dovra' andare una volta che "copio"
la configurazione su una nuova istanza, quindi /.config/nvim

<nome-applicazione>/<path-dove-inserire>/<file-configurazione>

Esempio concreto:

nvim/.config/nvim


# COME PORTARE FUORI DA CARTELLA DOTFILES
In una nuova istanza, clonero' la repo "dds-dotfiles", installero' stow,
mi spostero' dentro alla cartella "dds-dotfiles" ed eseguiro' il comando

```bash
stow nvim
```

o "stow <nome-applicazione>", in questa maniera stow creera' un symlink nel path "creato" dalla
naming convention, nel caso dell'esempio di neovim verra' creato dentro alla cartella .config un symlink
alla cartella nvim.
