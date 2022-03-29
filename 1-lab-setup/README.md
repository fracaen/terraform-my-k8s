# macOS

1. Install Docker Desktop on your Mac: https://www.docker.com/products/docker-desktop
1. Launch Docker Desktop, go in the Preferences, Settings (gear icon at the top right) and enable Kubernetes by checking the box: 
![screenshot](DockerDesktopKubernetes.png?raw=true)
1. Verify Kubernetes is running – the 2 icons at the bottom left should be green, like above.
1. If you don’t have one already, create a Docker ID: https://hub.docker.com/signup
1. Install Terraform:
    * If you already use homebrew, follow the "Homebrew on OS X" method in HashiCorp's [instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli).
    * Otherwise, follow the "Manual installation - Pre-compiled binary" method in HashiCorp's [instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli).
1. Open the Terminal application to access the shell on macOS
1. Make sure your system has the XCode Developer tools installed: `xcode-select --install` . This command opens an installation dialog box if needed. If XCode is already installed, you will see xcode-select: error: command line tools are already installed, use "Software Update" to install updates in your Terminal window. 
1. `cd` to the directory of your chosing for storing code
1. Download the lab guide from GitHub using git: `git clone https://github.com/fracaen/terraform-my-k8s`

# Windows

1. Follow https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package up to and including step 5
1. Follow https://docs.docker.com/docker-for-windows/install/
1. Open a command prompt: Press Win+R then type `cmd`
1. Test docker by running this command at the command prompt: `docker run hello-world`
1. If it errors out, continue https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package from step 6 to the end
1. Launch Docker Desktop, go in the Preferences, Settings (gear icon at the top right) and enable Kubernetes by checking the box: 
![screenshot](DockerDesktopKubernetes.png?raw=true)
1. Verify Kubernetes is running – the 2 icons at the bottom left should be green, like above.
1. If you don’t have one already, create a Docker ID: https://hub.docker.com/signup
1. Install Terraform. Follow the "Manual installation - Pre-compiled binary" method in HashiCorp's [instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli).
1. Download and install git from https://git-scm.com/downloads
1. At your command prompt: `cd` to the folder of your chosing for storing code. For example: `cd %USERPROFILE%\Documents\`
1. Download the lab guide from GitHub using git: `git clone https://github.com/fracaen/terraform-my-k8s`
1. `cd` into the folder downloaded by git