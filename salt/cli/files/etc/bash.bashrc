# Turn on checkwinsize
shopt -s checkwinsize
[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@$NICKNAME \W]\\$ "

# You might want to have e.g. tty in prompt (e.g. more virtual machines)
# and console windows
