
.PHONY:
help:
	@echo "Run 'make init' to initialize the local environment"

.PHONY:
init: set-override

.PHONY:
set-override:
	ln -sf conf/docker-compose.local.yml docker-compose.override.yml

.PHONY:
lint:
	-black --check src/; true

.PHONY:
format:
	docker-compose run app format

.PHONY:
check-format:
	docker-compose run app format --check
