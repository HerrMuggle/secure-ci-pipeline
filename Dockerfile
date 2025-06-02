# Use a lightweight Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy app code
COPY app/ .

# Copy semgrep rules directory (from Paul's repo, add your rules here)
COPY semgrep-rules/ ./semgrep-rules/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Default command runs the Flask app, but can be overridden
CMD ["python", "main.py", "run"]
