{% set minion_opts = salt.config.minion_config('/etc/salt/minion') %}
export NICKNAME={{ minion_opts['id'] }}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$NICKNAME\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@$NICKNAME:\w\$ '
fi
