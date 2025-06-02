# Use official slim Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies: curl, wget, gnupg (for Trivy), and other essentials
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Semgrep via pip
RUN pip install --no-cache-dir semgrep

# Install Trivy
RUN wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.63.0_Linux-64bit.deb \
    && dpkg -i trivy_0.63.0_Linux-64bit.deb \
    && rm trivy_0.63.0_Linux-64bit.deb

# Copy Python dependencies and install them
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY app/ .

# Default command - run your main.py with arguments passed
CMD ["python", "main.py"]
