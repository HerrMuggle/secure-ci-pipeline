# Use a lightweight Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install system dependencies and upgrade zlib1g
USER root
RUN apt-get update && apt-get install -y --only-upgrade zlib1g && rm -rf /var/lib/apt/lists/*

# Copy app code
COPY app/ .

# Copy semgrep rules directory
COPY semgrep-rules/ ./semgrep-rules/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install semgrep explicitly
RUN pip install --no-cache-dir semgrep

# Add a new user 'appuser' with a home directory
RUN useradd -m appuser

# Switch to the new user
USER appuser

# Default command runs the Flask app (can be overridden)
CMD ["python", "main.py", "run"]
