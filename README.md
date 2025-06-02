# Secure CI Pipeline with Semgrep

This project demonstrates a secure CI/CD pipeline that scans Python code for security issues using custom Semgrep rules.

## How It Works

- Custom Semgrep rule (`no-eval.yaml`) looks for use of `eval()` in Python.
- GitHub Actions runs Semgrep on every push or PR.
