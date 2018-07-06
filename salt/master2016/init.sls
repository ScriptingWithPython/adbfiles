# Install python-pip
# TODO Make this work on all the system that I use
install-python-pip:
  package.installed:
    - name: python-pip2 

# Install GitPython
install-gitpython:
  pip.installed:
    - name: GitPython
    - require:
      - install-python-pip

# Add gitfs remotes
add_gitfs_remotes:
  file.managed:
    - name: /etc/salt/master.d/gitfs_remotes.conf
    - source: salt://adb/master2015/files/etc-salt-master.d/gitfs_remotes.conf

# Add fileserver_backend
# gitfs is replaced with git in 2018
add_fileserver_backend:
  file.managed:
    - name: /etc/salt/master.d/fileserver_backend.conf
    - content: |
        fileserver_backend:
          - roots
          - gitfs
        top_file_merging_strategy: same

# # Restart salt-master
# restart_salt_master:
#   service.running:
#     - watch:
#       - add_gitfs_remotes
#       - add_fileserver_backend
#     - require:
#       - install-gitpythonn
