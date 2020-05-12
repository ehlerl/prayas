.PHONY: conda virtualenv

SHELL = /bin/bash

conda:
ifdef minimal
	conda env create -f environment-minimal.yml
else
	conda env create -f environment.yml
	jupyter labextension install @pyviz/jupyterlab_pyviz
endif
	conda activate khoj
	python setup.py install

virtualenv:
	virtualenv venv
	source venv/bin/activate
ifdef minimal
	pip3 install -r requirements-minimal.txt
else
	pip3 install -r requirements.txt
	jupyter labextension install @pyviz/jupyterlab_pyviz
endif
	python setup.py install