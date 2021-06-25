
SHELL := /bin/bash

lint:
	chef exec rubocop -A
	chef exec rubocop
	cookstyle .
	cookstyle test/fixtures/cookbooks/test_harness
