set_master_location_s:
  file.managed:
    - name: /etc/salt/minion.d/master.conf
    - source: salt://adb/minion/master.conf
    - template: jinja
