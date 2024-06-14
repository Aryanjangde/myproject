# Dockerfile

# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files to the working directory
COPY . /app/

# Run the Django development server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]
