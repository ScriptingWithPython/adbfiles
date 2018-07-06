install_redis_server:
  pkg.installed:
    - name: redis-server

redis_server_running:
  service.running:
    - name: redis-server
    - require:
      - install_redis_server
