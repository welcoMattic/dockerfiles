from zerobin.default_settings import *
DEBUG = True
STATIC_FILES_ROOT = os.path.join(ROOT_DIR, 'static')

PASTE_FILES_ROOT = os.path.join(ROOT_DIR, 'static', 'content')
TEMPLATE_DIRS = (
    os.path.join(ROOT_DIR, 'views'),
)
HOST = "0.0.0.0"
PORT = "8000"
USER = None     
GROUP = None     

MENU = (
    ('Home', '/'),                                              
    #<custom menu>                                                        
    ('Download 0bin', 'https://github.com/sametmax/0bin'),
    ('Contact', 'mailto:<email>')
)
