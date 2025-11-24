# Kubernetes
Complete Kubernetes Tutorial

    https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-kubectl-binary-on-windows-via-direct-download-or-curl
**Install kubectl binary on Windows (via direct download or curl)**
    You have two options for installing kubectl on your Windows device
    Direct download:
    Download the latest 1.34 patch release binary directly for your specific architecture by visiting the Kubernetes release page. Be sure to select the correct binary for your architecture (e.g., amd64, arm64, etc.).
Using curl:
    If you have curl installed, use this command:

    curl.exe -LO "https://dl.k8s.io/release/v1.34.0/bin/windows/amd64/kubectl.exe"
Note:
    To find out the latest stable version (for example, for scripting), take a look at https://dl.k8s.io/release/stable.txt.
    Validate the binary (optional)
    Download the kubectl checksum file:

    curl.exe -LO "https://dl.k8s.io/v1.34.0/bin/windows/amd64/kubectl.exe.sha256"
Validate the kubectl binary against the checksum file:
Using Command Prompt to manually compare CertUtil's output to the checksum file downloaded:

    CertUtil -hashfile kubectl.exe SHA256
    type kubectl.exe.sha256
Using PowerShell to automate the verification using the -eq operator to get a True or False result:

    $(Get-FileHash -Algorithm SHA256 .\kubectl.exe).Hash -eq $(Get-Content .\kubectl.exe.sha256)
Append or prepend the kubectl binary folder to your PATH environment variable.
Test to ensure the version of kubectl is the same as downloaded:

    kubectl version --client
Or use this for detailed view of version:

    kubectl version --client --output=yaml
Note:
Docker Desktop for Windows adds its own version of kubectl to PATH. If you have installed Docker Desktop before, you may need to place your PATH entry before the one added by the Docker Desktop installer or remove the Docker Desktop's kubectl.
