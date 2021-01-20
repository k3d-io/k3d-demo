.PHONY: run prep

demo:
	scripts/lifecycle.sh

demo-multiserver:
	scripts/multiserver.sh

demo-configfile:
	scripts/configfile.sh

demo-tilt:
	scripts/tilt.sh

demo-drone:
	scripts/drone.sh

prep:
	scripts/prep.sh