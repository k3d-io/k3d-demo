import logging as log
import os

# Log settings
LOG_LEVEL = os.environ.get("LOG_LEVEL", "warning").upper()

log.basicConfig(level=LOG_LEVEL)

AUDIENCE = os.environ.get("AUDIENCE", "Rancher")
SOMENAME = os.environ.get("SOMENAME", "Meetup")
