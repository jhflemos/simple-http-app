# Use an official lightweight Python image
FROM public.ecr.aws/docker/library/python:3.11.14-slim

# Set the working directory
WORKDIR /app

# Copy the app files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose the Flask app port
EXPOSE 8080

# Run the Flask app
CMD ["python", "simple_http_app.py"]