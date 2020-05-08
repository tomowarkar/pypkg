.PHONY: check
check: .circleci/config.yml
	circleci config validate && circleci local execute
