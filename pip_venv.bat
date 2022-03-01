@echo off
cmd /k "python -m venv api_venv & .\api_venv\Scripts\activate & pip install --upgrade pip & pip install -r requirements.txt"