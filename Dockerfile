FROM python:3.13-slim

WORKDIR /app

USER root

# Install build tools and zlib1g-dev, build zlib from source, hide build errors
RUN apt-get update && \
    apt-get install -y wget build-essential zlib1g-dev && \
    wget https://zlib.net/zlib-1.3.1.tar.gz && \
    tar xzf zlib-1.3.1.tar.gz && \
    cd zlib-1.3.1 && \
    ./configure > /dev/null 2>&1 && \
    make > /dev/null 2>&1 && \
    make install > /dev/null 2>&1 && \
    cd .. && \
    rm -rf zlib-1.3.1 zlib-1.3.1.tar.gz && \
    ldconfig && \
    apt-get remove -y wget build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY app/ .

COPY semgrep-rules/ ./semgrep-rules/

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir semgrep

RUN useradd -m appuser

USER appuser

CMD ["python", "main.py", "run"]
