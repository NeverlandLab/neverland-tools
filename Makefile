setup:
	virtualenv .venv -p python3.10
	./.venv/bin/pip install pip-tools

install:
	./.venv/bin/pip-compile -v
	./.venv/bin/pip-sync -v

release:
	python -m build
	include LICENSE
	include README.md
	recursive-include src *

push:
	git add . && codegpt commit . && git push