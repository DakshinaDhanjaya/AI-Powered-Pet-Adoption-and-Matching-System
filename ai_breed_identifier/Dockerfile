FROM python:3.10-slim

WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY . .

ENV PET_BREED_MODEL_PATH=pet_breed_model_phase1.pth
ENV UPLOAD_FOLDER=uploads

EXPOSE 5000

CMD ["python", "app.py"]
