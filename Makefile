.PHONY: docs


default: develop

clean:
	find src -name '*.pyc' | xargs rm
	find src -name '*.egg-info' | xargs rm -rf

develop: clean
	pip install -e .

lint:
	flake8 --exclude=**/migrations/*.py --format=pylint src/quiz/

release: clean
	pip install twine wheel
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine upload -s dist/*
