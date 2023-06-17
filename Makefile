PYTHON=python3.10

# Install Python 3.10.
install_python:
	@echo "Checking if ${PYTHON} is installed..."
	@if ! command -v ${PYTHON} >/dev/null 2>&1; then \
		echo "Unable to locate ${PYTHON}. Installing..."; \
		sudo apt install software-properties-common -y; \
		sudo add-apt-repository ppa:deadsnakes/ppa; \
		sudo apt install ${PYTHON}; \
		${PYTHON} --version; \
	else \
		echo "${PYTHON} is already installed"; \
		${PYTHON} --version; \
	fi


# Makes the virtual environment
venv: install_python
	@if [ ! -d "venv" ]; then \
		echo "Virtual environment not initialized. Creating venv environment."; \
		$(PYTHON) -m venv venv; \
		chmod +x venv/bin/activate; \
	else \
		echo "venv virtual environment already exists."; \
	fi


# Install all of the pip requirements
install_requirements: venv
	@. venv/bin/activate && \
		pip install -r requirements.txt;


# Install nodejs and Sass
install_sass:
	@sudo apt update; \
		sudo apt install nodejs npm; \
		sudo npm install -g node-sass;


# Install Bootstrap and dependencies
install_bootstrap:
	@echo "Installing Boostrap."
	@curl -LOk https://github.com/twbs/bootstrap/releases/download/v3.3.7/bootstrap-3.3.7-dist.zip; \
		unzip bootstrap-3.3.7-dist.zip -d ./core_app/static/;

	@echo "Installing JQuery.js."
	@wget https://code.jquery.com/jquery-3.7.0.min.js; \
		mv jquery-3.7.0.min.js ./core_app/static/js/;

	@echo "Installing Popper.js."
	@wget https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js; \
		mv popper.min.js ./core_app/static/js/;


# Install all of the dependencies to run the project.
install_dependencies: install_python venv install_requirements install_bootstrap install_sass
	@echo "Completed building all dependencies."


# Quick make for building the CSS
build_css:
	@echo "Building CSS packages"
	@npm run build-css


# Update static files
update_static: venv
	@. venv/bin/activate && \
		python manage.py collectstatic;


# Update Django database
migrate:
	@. venv/bin/activate && \
		python manage.py migrate;


# Run the server.
runserver:
	@. venv/bin/activate; \
		python manage.py runserver


all: install_python venv install_dependencies build_css runserver
