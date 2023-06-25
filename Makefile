PYTHON=python3.10
VENV=venv/bin/activate

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
		chmod +x ${VENV}; \
	else \
		echo "venv virtual environment already exists."; \
	fi


# Install all of the pip requirements
install_requirements: venv
	@. ${VENV} && \
		pip install -r requirements.txt;


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


# Instal nodejs
install_npm:
	@sudo apt update; \
		sudo apt install nodejs npm;


# Install Sass
install_sass: install_npm
	@sudo npm install -g node-sass;


# Install all linters for JS, HTML, and CSS
install_linters: install_npm
	@sudo npm install --save-dev eslint eslint-config-google; \
		sudo npm install --save-dev htmlhint; \
		sudo npm install --save-dev stylelint stylelint-config-standard stylelint-scss postcss-scss;


# Install all of the dependencies to run the project.
install_dependencies: install_python venv install_requirements install_bootstrap install_npm install_sass install_linters
	@echo "Completed building all dependencies."


# Quick make for building the CSS
build_css:
	@echo "Building CSS packages"
	@npm run build-css


# Update static files
update_static: venv
	@. ${VENV} && \
		python manage.py collectstatic;


# Update Django database
migrate:
	@. ${VENV} && \
		python manage.py migrate;


# Run the server.
runserver:
	@. ${VENV}; \
		python manage.py runserver;


pylint:
	@echo "Running PyLint on Python code.";
	@. ${VENV}; \
		pylint ./**/*.py;
	@echo "Python linting was successful!"


eslint:
	@echo "Running ESLint on Javascript code.";
	@npx eslint . --ext .js;
	@echo "Javascript linting was successful!"


htmlhint:
	@echo "Running HTMLHint on HTML code.";
	@npx htmlhint --config ./.htmlhintrc --ignore="**/venv/**";
	@echo "HTML linting was successful!"


stylelint:
	@echo "Running StyleLint on SCSS code.";
	@npx stylelint ./**/*.scss;
	@echo "CSS linting was successful!"


lint: pylint eslint htmlhint stylelint


all: install_python venv install_dependencies build_css update_static migrate runserver
