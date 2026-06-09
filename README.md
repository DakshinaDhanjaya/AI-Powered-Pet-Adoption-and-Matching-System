# PetMatch — AI-Powered Pet Adoption System

PetMatch is a full-stack group project that helps volunteers, shelters, adopters and administrators manage pet adoption workflows. It combines a React/Vite frontend, a Spring Boot backend with MongoDB, and two Python microservices: a PyTorch-based breed identifier and a scikit-learn KNN recommendation API.

Badges: React | Spring Boot | Python | MongoDB | PyTorch | scikit-learn

## Architecture Overview

- Frontend (React + Vite) — `http://localhost:5173`
- Backend (Spring Boot) — `http://localhost:8080`
- Breed Identification API (Flask + PyTorch) — `http://localhost:5000`
- Recommendation API (Flask + scikit-learn) — `http://localhost:5001`

The frontend talks to the backend for user/pet management and to the two AI services for breed identification and recommendations. The backend persists data to MongoDB Atlas and stores uploaded images on disk by default.

## Run Locally

Prerequisites: Java 17+, Maven, Node.js (18+), Python 3.10+, pip

Open four terminals and run:

```powershell
# Backend (Spring Boot)
cd backend
mvn spring-boot:run

# Breed identifier (Flask + PyTorch)
cd ai_breed_identifier
pip install -r requirements.txt
python app.py

# Recommendation API (Flask + scikit-learn)
cd recommendation_api
pip install -r requirements.txt
python app.py

# Frontend (React / Vite)
cd frontend
npm install
npm run dev
```

## Deployment (Free)

Suggested hosting plan:

- Frontend: Vercel or Netlify (static SPA)
- Backend: Render or Railway (Docker-based web service)
- Breed Identifier: Render (Docker) or Hugging Face Spaces (preferred if you need free GPU)
- Recommendation API: Render or Railway (Docker)

Set environment variables on each host (MongoDB URI, model paths, upload storage). Use object storage (Supabase/Cloudinary/AWS S3) for images in production.

## Preparing for GitHub

- Sensitive files are excluded by `.gitignore` (local `application.properties`, `.env`, model binaries)
- Use `backend/src/main/resources/application.properties.example` and the Flask `.env.example` files as templates for deployment secrets.

## Team

This is a group project — include all contributor names and roles in your repo description. If you'd like, I can create a `CONTRIBUTING.md` and `CODE_OF_CONDUCT.md` next.
# Pet Adoption Website - PetMatch

## Setup

### 1. Database (MySQL)
- Database name: `demo`
- Run `database/schema.sql` in MySQL (optional - Spring Boot creates tables and admin user automatically)

### 2. Backend (Spring Boot)
```bash
cd backend
mvn spring-boot:run
```
Runs on http://localhost:8080

### 3. Frontend (React)
```bash
cd frontend
npm install
npm run dev
```
Runs on http://localhost:5173

## Demo Accounts
| Role | Email | Password |
|------|-------|----------|
| Adopter | test@example.com | test123 |
| Admin | admin@petmatch.com | admin123 |

Admin account is auto-created on first backend startup.

## Pages
- **Home** (/) - Hero slider, action buttons (Volunteer, Adopter, Seller, Pet Breed)
- **Volunteer Form** (/volunteer) - Pet registration (requires login)
- **Admin Dashboard** (/admin) - View all pet registrations, edit, delete (Admin only)
- **Login/Register** (/login, /register)

## Pet Registration Flow
1. Sign in (or create account with Volunteer/Shelter role)
2. Click Volunteer/Shelter on home page
3. Fill form: type, category, breed, age, health, behavior tags, photos (3-4), contact info
4. Images are saved in backend `uploads/` folder, paths stored in database
