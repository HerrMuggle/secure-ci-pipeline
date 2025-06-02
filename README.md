> ⚠️ This application is **intentionally vulnerable**. It is built for demonstration purposes only. Do not deploy this in production environments.

# Secure CI/CD Pipeline Demo

This project demonstrates a Dockerized secure CI/CD pipeline integrating multiple security tools:

- **Semgrep** — Static Application Security Testing (SAST)
- **Trivy** — Container image & filesystem vulnerability scanner
- **Checkov** — Infrastructure as Code (IaC) security scanning (Terraform)
- **OPA (Open Policy Agent)** — Policy as code for IaC validation

---

## Tech Stack

- Python 3.13 (Flask app and CLI runner)
- Docker (for containerizing app and scans)
- GitHub Actions (CI/CD workflows)
- Semgrep (static code analysis)
- Trivy (container & filesystem vulnerability scanning)
- Checkov (Terraform IaC scanning)
- OPA (policy enforcement on IaC)

---

## Usage

### Build Docker image

```bash
docker build -t secure-ci-app .
```

### Run Semgrep scan inside container

```bash
docker run --rm secure-ci-app python main.py semgrep
```
### Run Trivy scan inside container

```bash
docker run --rm secure-ci-app python main.py trivy
```

### Show help commands

```bash
docker run --rm secure-ci-app python main.py help
```

### Scan your local code by mounting your directory into container

```bash
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py semgrep
docker run --rm -v "$(pwd)":/app secure-ci-app python main.py trivy
```

---

## Project Structure

```
secure-ci-pipeline/
├── app/
│   ├── main.py
│   ├── requirements.txt
├── semgrep-rules/
│   └── ... (custom Semgrep rules)
├── Dockerfile
├── README.md
├── .github/
│   └── workflows/
│       ├── security.yml
│       └── iac-security.yml
└── iac-checkov-opa/
    ├── policies/
    ├── main.tf
    └── requirements.txt
```

---

## What it does

- Runs Semgrep with auto or custom rules to catch insecure code patterns

- Runs Trivy to detect high/critical vulnerabilities in container images and filesystem

- Runs Checkov and OPA on your Terraform IaC for policy compliance and security

- Uploads Semgrep results as SARIF to GitHub Security tab for easy review

- Automates all scans via GitHub Actions CI/CD pipelines

---

## Notes

- The Flask app contains an intentional vulnerability for demonstration purposes.

- Customize and extend Semgrep rules under `semgrep-rules/`.

- Ensure your IaC code is under `iac-checkov-opa/` for the IaC scanning workflows.

---

## Author
Modified and extended by `Michael A.`, building on a public demo project by Paul D., Security Automation Engineer.
