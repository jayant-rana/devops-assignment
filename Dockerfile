# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python and pip
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set the working directory inside the container
WORKDIR /app

# Copy application files
COPY . .

# Create a virtual environment and install dependencies inside it
RUN python3 -m venv /app/venv && \
    /app/venv/bin/pip install --no-cache-dir fastapi uvicorn

# Expose the FastAPI default port
EXPOSE 8000

# Use the virtual environment to run FastAPI
CMD ["/app/venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
