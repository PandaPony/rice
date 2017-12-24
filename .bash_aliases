#Configs
alias cfa="vim ~/.bash_aliases"

#Todo: Stop hardcoding punk

#DevOps
## WP-CLI & Ghostscript setup for comfy gravity flow testing
alias f="wp gf form edit 4 --ssh=yes --path=\"/var/www/vhosts/i-0a1b40470e828a142\""

##Full stack setup for automated acceptance testing - Docker, Codeception, PHP, Gravity Flow. Guide: https://www.stevenhenty.com/acceptance-testing-wordpress-plugins/
alias tst="ssh -i ~/.ssh/UbuntuAWS.pem ubuntu@ec2-18-195-202-122.eu-central-1.compute.amazonaws.com"
alias rdb="ssh wp@bb99s.myraidbox.de"
# Check .ssh/config for line below ..ssh alias blabla
alias sswp="ssh yes"

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
