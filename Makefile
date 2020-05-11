.PHONY: run prep

demo:
	scripts/lifecycle.sh

demo-multimaster:
	scripts/multimaster.sh

prep:
	scripts/prep.sh