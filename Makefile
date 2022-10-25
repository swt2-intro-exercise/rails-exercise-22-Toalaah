.PHONY: all help install migrate tests run

all: help

install: ## Install dependencies
	bundle install

migrate: ## Migrate database
	rails db:migrate RAILS_ENV=development && rails db:migrate RAILS_ENV=test

tests: ## Run tests
	bundle exec rspec

run: ## Run dev server
	rails s

help: ## Print this help menu
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
