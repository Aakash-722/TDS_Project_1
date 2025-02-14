# Use Python 3.11 as the base image
FROM python:3.11-slim

# Set working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies directly using pip
RUN pip install \
    pandas \
    fastapi \
    uvicorn \
    requests \
    python-multipart \
    faker \
    pillow \
    numpy \
    sentence-transformers \
    openai \
    duckdb \
    beautifulsoup4 \
    markdown \
    pytesseract \
    httpx \
    pydantic

# Copy all your Python files and other necessary files
COPY . .

# Create necessary directories
RUN mkdir -p /app/data

# Expose the port your API runs on
EXPOSE 8000

# Set environment variable
ENV AIPROXY_TOKEN=${AIPROXY_API}

# Command to run your API server (assuming main.py is your entry point)
CMD ["python", "main.py"]