FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PET_REC_MODEL_PATH=static/ml/best_knn_model.pkl
ENV PET_REC_DATA_PATH=updated_pet_dataset.csv

EXPOSE 5001

CMD ["python", "app.py"]
