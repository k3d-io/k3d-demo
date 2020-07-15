.PHONY: run prep

demo:
	scripts/lifecycle.sh

demo-multiserver:
	scripts/multiserver.sh

prep:
	scripts/prep.sh