from zerobin.default_settings import *
DEBUG = True
STATIC_FILES_ROOT = os.path.join(ROOT_DIR, 'static')

TEMPLATE_DIRS = (
    os.path.join(ROOT_DIR, 'views'),
)
HOST = "0.0.0.0"
PORT = "8000"
USER = "0bin"
GROUP = "0bin"

PASTE_FILES_ROOT = "/paste"

MENU = (
    ('Home', '/'),
    #<custom menu>
    ('Download 0bin', 'https://github.com/sametmax/0bin'),
    ('Contact', 'mailto:admin@domain.tld')
)

