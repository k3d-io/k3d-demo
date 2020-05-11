import os
from app.app import app

def get(key, default_value=None, coerce=lambda x: x):
    return coerce(os.environ.get(key, default_value))


bind = get('GUNICORN_BIND', '0.0.0.0:5000')
workers = get('GUNICORN_WORKERS', 4, coerce=int)
accesslog = get('GUNICORN_ACCESSLOG', '-')
errorlog = get('GUNICORN_ERRORLOG', '-')
loglevel = get('GUNICORN_LOGLEVEL', 'info')
preload_app = get('GUNICORN_WORKER_CLASS', True, coerce=lambda x: x == 'True')
worker_class = get('GUNICORN_WORKER_CLASS', 'sync')
max_requests = get('GUNICORN_MAX_REQUESTS', 1000, coerce=int)
threads = get('GUNICORN_THREADS', 1, coerce=int)
timeout = get('GUNICORN_TIMEOUT', 30, coerce=int)
