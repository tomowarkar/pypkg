.PHONY: check
check: .circleci/config.yml
	circleci config validate && circleci local execute

.PHONY: diff
diff:
	@diff=$(git diff --diff-filter=d --name-only HEAD | grep src/ )
	@[ "${diff}" = "" ] && echo 0 || echo 1

.PHONY: create
create:
	sphinx-apidoc -f -o ./docs/source ./src
	sphinx-build -a ./docs/source ./docs/build
