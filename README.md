
<h3 align="center">API Framework for JsonPlaceHolder Service</h3>


---

<p align="center"> API test BDD framework built using Python, requests, behave
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Project structure](#project_structure)
- [TODO](#TODO)
- [Authors](#authors)



This is an API  Rest services BDD test framework. Following features are tested
1. Get Users
2. Make Posts
3. Comment on Posts

## 🏁 Getting Started <a name = "getting_started"></a>

1. Clone the project
2. See [Prerequisites](#Prerequisites) for dependencies

### Prerequisites

This framework has been tested on Windows. Following dependencies have been used
1. Python 3.9.6
2. Behave 1.2.6
3. Requests 2.27.1
4. Cerberus 1.3.4
5. loguru 0.6.0
6. behave-html-formatter 0.9.8


### Setting up venv

Follow below steps to set-up venv

```
1. cd into root folder
2. create venv using python -m venv api_venv
3. activate venv --> .\api_venv\Scripts\activate
4. pip install --upgrade pip
5. Now install dependencies using pip
   pip install -r requirements.txt

OR 
1. cd into root folder
2. run pip_ven.bat in elevated access
```

Note:

```
If you want to install any new dependency, use
pip install <package==version>
and then freeze requirements using 
pip freeze > requirements.txt
```

## 🔧 Running the tests <a name = "tests"></a>

1. Before running the tests make sure you set-up the dependency
2. once the venv is activated, you can run the tests using
```
To run a feature
    behave -f pretty .\src\tests\features\<feature>
    Example: to run list_users feature
    behave -f pretty .\src\tests\features\list_users

To run a scenario
    behave  .\src\tests\features\<feature> -n "<scenario name>"
    Example: to run a scenario from list users
    behave  .\src\tests\features\list_users -n "Verify header content-type for Get users"

To generate a simple html report, run following command
    behave  -f html -o JSONPlaceholder.html .\src\tests\features\list_users
```

### Break down into tests

Tests for 3 features have been written

```
Get Users feature: This will list all users
Post feature: This allows you to make a post
Comment feature: This allows you to comment on a post
```

##  Project Structure <a name = "project_structure"></a>
```
src
|--tests
|   |--features
|         |--commmon steps
|         |--feature folder
|         |      |--steps folder
|         |      |--feature file
|         |--utils
|              |--helper
|              |--project_constants
|--behave.ini
|--.gitignore
|--pip_venv.bat
|--README.md
|--requirements.txt
```

##  TODO <a name = "TODO"></a>
1. Improve logging
2. Improve reporting

## ✍️ Authors <a name = "authors"></a>

- [@sanmechie](https://github.com/sanmechie)

