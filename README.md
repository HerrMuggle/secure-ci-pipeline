# Secure CI/CD Pipeline

This project provides a Dockerized secure CI/CD pipeline demo app that integrates security scanning tools:

- **Semgrep** — static code analysis
- **Trivy** — container image and filesystem vulnerability scanning

---

## How to use this with your Docker container

### Build your Docker image:

```bash
docker build -t secure-ci-app .

### Run Semgrep scan:

```bash
docker run --rm secure-ci-app python main.py semgrep

### Run Trivy scan:

```bash
docker run --rm secure-ci-app python main.py trivy

### Show help / usage:

```bash
docker run --rm secure-ci-app python main.py help


---

## What it does

Runs Semgrep with --config=auto scanning the current directory.

Runs Trivy to scan the current filesystem for HIGH and CRITICAL severity vulnerabilities.

Prints output and error messages from each scan.

Shows usage instructions if no command or an invalid command is provided.

## Notes

You can scan your local code by mounting your directory into the container:

```bash
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py semgrep

```bash
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py trivy
