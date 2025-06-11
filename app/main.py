import argparse
import subprocess
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    # 🔥 Intentional insecure code for Semgrep to find
    eval("print('This is a Semgrep test finding')")  # Semgrep should flag this
    return "Secure CI/CD Example"

def run_semgrep():
    print("Running Semgrep scan...")
    # Use --config=auto or custom rules directory if you want
    result = subprocess.run(
        ["semgrep", "--config=auto", "--verbose"],
        capture_output=True,
        text=True,
    )
    print(result.stdout)
    print(result.stderr)

def run_trivy():
    print("Running Trivy scan on local filesystem...")
    result = subprocess.run(
        ["trivy", "fs", "--severity", "HIGH,CRITICAL", "--exit-code", "1", "."],
        capture_output=True,
        text=True,
    )
    print(result.stdout)
    print(result.stderr)

def show_help():
    help_text = """
Usage: python main.py [command]

Commands:
  semgrep   Run Semgrep static code analysis scan
  trivy     Run Trivy vulnerability scan on filesystem
  help      Show this help message
  run       Run the Flask web app
"""
    print(help_text)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Secure CI/CD demo app")
    parser.add_argument("command", nargs='?', default="run", help="Command to run")
    args = parser.parse_args()

    if args.command == "semgrep":
        run_semgrep()
    elif args.command == "trivy":
        run_trivy()
    elif args.command == "help":
        show_help()
    elif args.command == "run":
        app.run(host='0.0.0.0', port=5000, debug=True)
    else:
        print(f"Unknown command: {args.command}")
        show_help()

echo 'eval("print(\'This is a Semgrep test finding\')")  # Semgrep should flag this' > app/main.py
