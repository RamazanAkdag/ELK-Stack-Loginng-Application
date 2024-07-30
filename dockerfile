# Temel imaj olarak Python'un resmi imajını kullan
FROM python:3.9-slim

# Çalışma dizinini ayarla
WORKDIR /app

# pip'i güncelle
RUN python -m pip install --upgrade pip

# Gereksinim dosyasını ve uygulama kodunu kopyala
COPY requirements.txt requirements.txt
COPY app.py app.py

# Sanal ortam oluştur ve aktiv et
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Gerekli Python paketlerini yükle
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama başlatma komutunu ayarla
CMD ["python", "app.py"]



