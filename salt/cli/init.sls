# srv/salt/cli/init.sls
# All systems have some common modification that should be done
#
# PS1 needs to have the minion id in it rather than the AWS hostname that is
# less-than-useful

prompt_sets_minion_id_in_ps1:
  file.managed:
    - name: /etc/profile.d/prompt.sh
    - source: salt://adb/cli/files/etc/profile.d/prompt.sh

default_bashrc_uses_nickname:
  file.managed:
    - name: /etc/bashrc
    - source: salt://adb/cli/files/etc/bashrc

