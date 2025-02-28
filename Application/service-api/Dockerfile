FROM python:3.9-slim

# Working Directory
WORKDIR /app

# Copy Necessary File
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Expose port 80
EXPOSE 80

# Launch Flask App
CMD ["python", "app.py"]