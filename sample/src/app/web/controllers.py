import logging as log
import os
from flask import Flask, render_template, request
from .. import settings
from . import bp


@bp.route("/", methods=["GET"])
def index():
    return render_template("index.html", audience=settings.AUDIENCE)
