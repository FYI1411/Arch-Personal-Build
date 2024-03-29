#source file for bash's aliases
alias aur='yay'
alias mf='cd ~/Desktop'
alias open='xdg-open'
alias cron='crontab ~/.crontab'
alias driver='sudo pacman -S $(cat ~/installs/drivers.txt)'
alias package='sudo pacman -S $(cat ~/installs/packages.txt)'
alias aur_package='yay -S $(cat ~/installs/aurs.txt)'
alias service='sudo systemctl enable --now $(cat ~/installs/services.txt)'
alias install='driver || package || aur_package || service'
alias clean='aur -Rns $(pacman -Qtdq); aur -Scc --noconfirm; sudo pacman -Scc --noconfirm'
alias update='aur && clean'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirror='sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias ga='git add -A'
alias gc='git checkout -- '
alias gs='git status'
alias gd='git diff'
alias gr='git rm -rf --cached .'
