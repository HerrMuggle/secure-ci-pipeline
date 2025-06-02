import subprocess
import sys

def run_semgrep():
    print("Running Semgrep scan...")
    result = subprocess.run(["semgrep", "--config=auto", "."], capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print("Semgrep errors or findings detected:")
        print(result.stderr)
    else:
        print("Semgrep scan completed successfully.")

def run_trivy():
    print("Running Trivy scan...")
    # Scan current directory, assuming Dockerfile or files present for Trivy scanning
    # You can customize Trivy args here
    result = subprocess.run(["trivy", "fs", "--severity", "HIGH,CRITICAL", "--no-progress", "."], capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print("Trivy scan detected issues:")
        print(result.stderr)
    else:
        print("Trivy scan completed successfully.")

def print_usage():
    print("Usage: python main.py [command]")
    print("Commands:")
    print("  semgrep   Run Semgrep scan on the current directory")
    print("  trivy     Run Trivy scan on the current directory")
    print("  help      Show this help message")

def main():
    if len(sys.argv) < 2:
        print("Error: No command provided.")
        print_usage()
        sys.exit(1)

    command = sys.argv[1].lower()

    if command == "semgrep":
        run_semgrep()
    elif command == "trivy":
        run_trivy()
    elif command == "help":
        print_usage()
    else:
        print(f"Unknown command: {command}")
        print_usage()
        sys.exit(1)

if __name__ == "__main__":
    main()
