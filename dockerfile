# 1. Usamos una imagen de Python ligera
FROM python:3.9-slim

# 2. Creamos una carpeta de trabajo dentro de la "caja"
WORKDIR /app

# 3. Copiamos el archivo de requisitos e instalamos
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiamos el resto de nuestro código
COPY . .

# 5. Exponemos el puerto que usa Streamlit (8501)
EXPOSE 8501

# 6. El comando para arrancar la app
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]