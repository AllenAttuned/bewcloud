.PHONY: start
start:
	deno task start

.PHONY: up
	docker-compose up

.PHONY: setup
setup:
	$(shell curl -fsSL https://deno.land/install.sh | sh)
	$(shell echo "export DENO_INSTALL="/home/gitpod/.deno"" >> ~/.bashrc)
	$(shell echo "export PATH="$DENO_INSTALL/bin:$PATH"" >> ~/.bashrc)

.PHONY: format
format:
	deno fmt

.PHONY: test
test:
	deno task check
	deno task test

.PHONY: build
build:
	deno task build

.PHONY: migrate-db
migrate-db:
	deno run --allow-net --allow-read --allow-env migrate-db.ts

.PHONY: crons/cleanup
crons/cleanup:
	deno run --allow-net --allow-read --allow-env crons/cleanup.ts

.PHONY: exec-db
exec-db:
	docker exec -it -u postgres $(shell basename $(CURDIR))-postgresql-1 psql
