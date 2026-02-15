# Variables
PYTHON=python3
VENV=.venv
PIP=$(VENV)/bin/pip
FLASK=$(VENV)/bin/flask

# Par défaut
.DEFAULT_GOAL := help

help:
	@echo "Commandes disponibles :"
	@echo " make venv        -> créer le virtualenv"
	@echo " make install     -> installer les dépendances"
	@echo " make run         -> lancer le serveur Flask"
	@echo " make freeze      -> geler requirements.txt"
	@echo " make clean       -> supprimer le venv"

# Création venv
venv:
	$(PYTHON) -m venv $(VENV)

# Installation dépendances
install: venv
	$(PIP) install -r requirements.txt

# Lancer Flask
run:
	FLASK_APP=app.py FLASK_ENV=development $(FLASK) run --host=0.0.0.0 --port=5000

# Freeze deps
freeze:
	$(PIP) freeze > requirements.txt

# Nettoyage
clean:
	rm -rf $(VENV)
