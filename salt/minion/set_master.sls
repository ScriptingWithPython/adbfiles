set_master_location_s:
  file.managed:
    - name: /etc/salt/minion.d/master.conf
    - source: salt://adb/minion/master.conf
    - template: jinja

maybe_restart_minion:
  service.running:
    - name: salt-minion
    - watch:
      - set_master_location_s
