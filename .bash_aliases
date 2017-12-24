#Todo: Stop hardcoding punk

#DevOps
## WP-CLI & Ghostscript setup for comfy gravity flow testing
alias f="wp gf form edit 4 --ssh=yes --path=\"/var/www/vhosts/i-0a1b40470e828a142\""

##Full stack setup for automated acceptance testing - Docker, Codeception, PHP, Gravity Flow. Guide: https://www.stevenhenty.com/acceptance-testing-wordpress-plugins/
alias tst="ssh yes"

#Env
alias drk="dynamic-colors switch solarized-dark"
alias lgt="dynamic-colors switch solarized-light"
alias cfp="sudo vim /etc/cups/cups-files.conf"

#ETL
alias pbi="wine .wine/drive_c/Program\ Files\ \(x86\)/Microsoft\ Power\ BI\ Desktop/bin/PBIDesktop.exe"

# Sales Tour

## Cold call close example > Real estate
alias sp="vlc ~/Downloads/PR_1ce888bd-2496-e166-ee79-596379feef4c.mp3"
## Cold call signed contract > Real estate
alias pt="mupdf ~/Downloads/ID_11977685.pdf"

## Cold call close example > Manufacturing example
alias sp1="vlc ~/Downloads/PR_58b31c69-f30a-aeda-3c6e-90e295ae6108.mp3"

# Whatever foo stuff
alias man="BROWSER=chromium man -H"
# Todo: Add task via ROFI
# ta() { task add $1 due:$2;}


#Basic Aliases
alias v="vim"
alias gv="gvim"
alias sv="sudo vim"
alias ls='ls --color=auto --group-directories-first'
alias lsa='ls -A'
alias b="cd .. && ls -a"
alias q="exit"
alias e="exit"

alias PS="sudo pacman -S"
alias PRns="sudo pacman -Rns"
alias PSyu="sudo pacman -Syu"
alias PSyyu="sudo pacman -Syyu"
alias PQn="sudo pacman -Qn"

#Term only
alias mnt="sudo bash ~/.config/Scripts/mount.sh"
alias umnt="sudo bash ~/.config/Scripts/unmount.sh"
alias newnet="sudo systemctl restart NetworkManager"

#etc
alias Txa="cp ~/Documents/LaTeX/article.tex"
alias Txs="cp ~/Documents/LaTeX/beamer.tex"
alias Txh="cp ~/Documents/LaTeX/handout.tex"
givegit() { git clone http://github.com/$1.git ;}
alias h="cd ~ && ls -a"
alias cf="cd ~/.config && ls -a"
alias d="cd ~/Documents && ls -a"
alias D="cd ~/Downloads && ls -a"
alias pp="cd ~/Pictures && ls -a"
alias pw="cd ~/Pictures/Wallpapers && ls -a"
alias m="mutt"
#alias cfb="vim ~/.config/Scripts/bashrc"
alias cfb="vim ~/.bashrc"
alias cfz="vim ~/.zshrc"
alias cfv="vim ~/.vimrc"
alias cfr="vim ~/.config/ranger/rc.conf"
alias cfi="vim ~/.config/i3/config"
alias cfm="vim ~/.config/mutt/muttrc"
alias cff="vim ~/.config/Scripts/folders"
alias cfc="vim ~/.config/Scripts/configs"
alias cfg="vim ~/.config/mutt/gmail.conf"
alias cfa="vim ~/.bash_aliases"
