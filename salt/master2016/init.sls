# Install python-pip
# TODO Make this work on all the system that I use
install-python-pip:
  pkg.installed:
    - name: python-pip

# Install GitPython
install-gitpython:
  pip.installed:
    - name: GitPython
    - require:
      - install-python-pip

add_dirs:
  file.directory:
    - name: /etc/salt/master.d
    - makedirs: True

add_dirs_2:
  file.directory:
    - name: /srv/salt/

add_top_file:
  file.managed:
    - name: /srv/salt/top.sls
    - contents: |
        base: {}


# Add gitfs remotes
add_gitfs_remotes:
  file.managed:
    - name: /etc/salt/master.d/gitfs_remotes.conf
    - source: salt://adb/master2016/files/etc-salt-master.d/gitfs_remotes.conf
    - require:
      - add_dirs

# Add fileserver_backend
# gitfs is replaced with git in 2018
add_fileserver_backend:
  file.managed:
    - name: /etc/salt/master.d/fileserver_backend.conf
    - require:
      - add_dirs
    - contents: |
        fileserver_backend:
          - roots
          - gitfs
        top_file_merging_strategy: same

# Restart salt-master
restart_salt_master:
  service.running:
    - name: salt-master
    - watch:
      - add_gitfs_remotes
      - add_fileserver_backend
    - require:
      - install-gitpython
