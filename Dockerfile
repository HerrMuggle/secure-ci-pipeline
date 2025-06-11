# Use a lightweight Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install build tools and install/upgrade zlib safely
USER root
RUN apt-get update && \
    apt-get install -y wget build-essential libapt-pkg6.0 zlib1g-dev && \
    wget https://zlib.net/zlib-1.3.1.tar.gz && \
    tar xzf zlib-1.3.1.tar.gz && \
    cd zlib-1.3.1 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf zlib-1.3.1 zlib-1.3.1.tar.gz && \
    ldconfig && \
    apt-get remove -y wget build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

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
