# 🔐 Secure CI/CD Pipeline with Docker, Semgrep & Trivy

> ⚠️ This application is intentionally vulnerable. It is built for demonstration purposes only.  
> **Do not deploy this in production environments.**

This project showcases a **DevSecOps CI/CD pipeline** that integrates security scanning directly into the development workflow using:

- A containerized Python app
- Static and dynamic analysis tools (Semgrep & Trivy)
- GitHub Actions for automated scans
- Optional SARIF integration for GitHub Security alerts

---

## What It Does

- Runs **Semgrep** with `--config=auto` to scan for insecure code patterns.
- Runs **Trivy** to detect **HIGH** and **CRITICAL** vulnerabilities in the app’s file system and container.
- Provides easy-to-read output and error messages.
- Displays usage instructions for invalid or missing commands.

---

## 🧱 Tech Stack

| Component        | Purpose                                |
|------------------|----------------------------------------|
| Python (Flask)   | Lightweight web application (optional) |
| Docker           | Containerization of the CLI-based scanner |
| GitHub Actions   | CI/CD workflow automation (optional)   |
| Semgrep          | Static AppSec scanning tool            |
| Trivy            | Container and filesystem vulnerability scanner |
| SARIF            | GitHub-integrated security report format (optional) |

---

## 🐳 How to Use:

### Build the Docker Image:

```bash
docker build -t secure-ci-app .```

### Run Semgrep Scan

```bash
docker run --rm secure-ci-app python main.py semgrep```

### Run Trivy Scan

```bash
docker run --rm secure-ci-app python main.py trivy```

### docker run --rm secure-ci-app python main.py help

```bash
docker run --rm secure-ci-app python main.py help```

### Mount Local Code for Scanning

```bash
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py semgrep```

```bash
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py trivy```

---

## Project Structure

secure-ci-pipeline/
├── app/
│   ├── main.py
│   ├── requirements.txt
├── Dockerfile
├── README.md

---

## Learning Outcomes

- Implementing static & dynamic analysis in CI/CD

- Running security tools in containers

- Automating secure code scanning in pipelines

- Building your own security command center


Modified and extended by Michael Arruda, building on a public demo project by Paul D., Security Automation Engineer.
