# NikolaiJAlexander.com

This repository contains the source code for the https://www.nikolaijalexandder.com website, which showcases my work experience, projects and portfolio.

## Table of Contents
- [NikolaiJAlexander.com](#nikolaijalexandercom)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Requirements](#requirements)
  - [Installation](#installation)
    - [Unix/Linux](#unixlinux)
    - [Windows](#windows)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Overview
The NikolaiJAlexander.com website is built using the Django web framework. It includes various pages and features for presenting the portfolio and projects of Nikolai Alexander.
## Requirements

Before running this project, make sure you have the following requirements installed:

- Python 3.10
- Django 4.2.1
- Other dependencies listed in the `requirements.txt` file

To install the required dependencies, you can use pip:

## Installation
To run the NikolaiJAlexander.com website locally, follow these steps:

### Unix/Linux

1. Clone the repository:
```shell
git clone https://github.com/njalexander93/NikolaiJAlexander.com.git
```

2. Create and activate a virtual environment:
```shell
python3 -m venv myenv
source myenv/bin/activate
```

3. Install the project dependencies:
```shell
cd NikolaiJAlexander.com
pip install -r requirements.txt
```

1. Perform initial database migrations:
```shell
python manage.py migrate
```

1. Run the development server:
```shell
python manage.py runserver
```
The website will be accessible at http://localhost:8000/.

### Windows
1. Clone the repository:
```shell
git clone https://github.com/njalexander93/NikolaiJAlexander.com.git
```

2. Create and activate a virtual environment:
```shell
python -m venv myenv
myenv\Scripts\activate
```

3. Install the project dependencies:
```shell
cd NikolaiJAlexander.com
pip install -r requirements.txt
```

4. Perform initial database migrations:
```shell
python manage.py migrate
```

5. Run the development server:
```shell
python manage.py migrate
```

The website will be accessible at http://localhost:8000

## Usage
To use the NikolaiJAlexander.com website locally, follow these steps:

1. Access the website in your browser:
```arduino
http://localhost:8000/
```

2. Explore the various pages and sections to learn about my work experience, projects, and portfolio.

## Contributing

Contributions to this project are not allowed as per the terms of the CC BY-ND 4.0 license. You are welcome to use the code for your own purposes, but modifications and derivative works are not permitted.

## License

This project is licensed under the [Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)](https://creativecommons.org/licenses/by-nd/4.0/) license. By using this code, you agree to comply with the terms and conditions of the license.

For more information, please see the [LICENSE.txt](LICENSE.txt) file.
