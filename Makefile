
SHELL := /bin/bash

lint:
	chef exec rubocop -A
	chef exec rubocop
	foodcritic .
	foodcritic test/fixtures/cookbooks/test_harness
