setup:
	virtualenv .venv -p python3.10
	./.venv/bin/pip install pip-tools

install:
	./.venv/bin/pip-compile -v
	./.venv/bin/pip-sync -v

release:
	python setup.py sdist bdist_wheel
	twine upload dist/*
