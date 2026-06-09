@echo off
setlocal

echo Starting Java Backend...
start "Java Backend" cmd /k "cd backend && mvn spring-boot:run"

echo Waiting for Java Backend to initialize...
timeout /t 10

echo Checking dependencies for CNN Model (Breed Identifier)...
cd ai_breed_identifier
python -c "import torch, torchvision, flask, flask_cors, PIL" 2>nul
if %errorlevel% neq 0 (
    echo Missing dependencies. Installing...
    pip install -r requirements.txt
)
cd ..

echo Starting CNN Model (Breed Identifier) on port 5000...
start "CNN Model (Port 5000)" cmd /k "cd ai_breed_identifier && python app.py"

echo Waiting for CNN Model to initialize...
timeout /t 5

echo Checking dependencies for KNN Model (Recommendation API)...
cd recommendation_api
python -c "import flask, flask_cors, pandas, sklearn" 2>nul
if %errorlevel% neq 0 (
    echo Missing dependencies. Installing...
    pip install -r requirements.txt
)
cd ..

echo Starting KNN Model (Recommendation API) on port 5001...
start "KNN Model (Port 5001)" cmd /k "cd recommendation_api && python app.py"

echo Waiting for KNN Model to initialize...
timeout /t 5

echo Checking dependencies for Frontend...
cd frontend
if not exist node_modules (
    echo Installing node modules...
    npm install
)
cd ..

echo Starting Frontend...
start "Frontend" cmd /k "cd frontend && npm run dev"

echo All services are starting up in separate windows!
pause
