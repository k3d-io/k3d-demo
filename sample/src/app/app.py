from flask import Flask
from . import settings

# create app
app = Flask(__name__, template_folder="web/templates", static_folder="web/static")
app.config.from_object("app.settings")

# register blueprints
from .web import bp as web

app.register_blueprint(web)
