from flask import Blueprint

bp = Blueprint("web", __name__, url_prefix="/")

from . import controllers
