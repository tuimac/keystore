chdir = '/root/keystore/src/backend'
wsgi_app = 'backend.wsgi:application'
reload = True
bind = 'unix:/run/gunicorn.sock'
workers = 2
worker_connections = 1000
keepalive = 120
timeout = 30
accesslog = '/var/log/gunicorn/access.log'
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
errorlog = '/var/log/gunicorn/error.log'
loglevel = 'info'
capture_output = True
proc_name = 'file_server'
pidfile = '/var/run/gunicorn.pid'