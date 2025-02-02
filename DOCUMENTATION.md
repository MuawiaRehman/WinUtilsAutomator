# WinUtilsAutomator Documentation

**Version**: v1.0.0  
**Description**:  
This documentation provides detailed instructions for using **WinUtilsAutomator**, a collection of batch scripts and utilities designed to automate Windows setup and configuration tasks. The project includes a sub-project named **WinBatchInstaller**, which simplifies Windows installation and configuration through batch scripts.

---

## Table of Contents

1. [Overview](#overview)
2. [WinBatchInstaller](#winbatchinstaller)
   - [win-installer.bat](#win-installer.bat)
   - [disk-partitioning.bat](#disk-partitioning.bat)
   - [dism.bat](#dism.bat)
3. [Installation and Setup](#installation-and-setup)
4. [Usage Instructions](#usage-instructions)
5. [Advanced Usage](#advanced-usage)
6. [Contributing](#contributing)
7. [License](#license)

---

## Overview

**WinUtilsAutomator** is a collection of batch scripts designed to automate various Windows installation, configuration, and management tasks. The main feature of the project is **WinBatchInstaller**, which automates the Windows installation process for both UEFI and BIOS modes. The toolset aims to streamline Windows setup by simplifying disk partitioning, image deployment, and bootloader configuration.

---

## WinBatchInstaller

**WinBatchInstaller** is a sub-project that includes the following batch scripts for automating Windows installation:

### 1. win-installer.bat
The main script that provides an interactive menu for users to:
- Install Windows in UEFI Mode.
- Install Windows in BIOS Mode.
- Cancel the installation.

### 2. disk-partitioning.bat
Responsible for partitioning the disk based on the selected installation mode:
- In **UEFI Mode**, it creates an EFI partition and a primary NTFS partition.
- In **BIOS Mode**, it creates a single NTFS partition and converts the disk to MBR.

### 3. dism.bat
This script applies the Windows image to the NTFS partition:
- Extracts the Windows edition from `install.wim`.
- Applies the selected Windows edition to the target disk.
- Configures the bootloader for the selected installation mode.

---

## Installation and Setup

1. **Download and Prepare**:  
   - Download the **WinUtilsAutomator** batch scripts (`win-installer.bat`, `disk-partitioning.bat`, `dism.bat`) from the GitHub repository.
   - Place all batch files in the same directory.
   - Copy these scripts to a USB flash drive or any removable media.

2. **Windows Installation Media**:
   - WinBatchInstaller scripts containing USB.  
   - Ensure you have a Windows installation ISO mounted as a virtual drive or on a USB drive.
   - You will also need a target disk for the Windows installation.

---

## Usage Instructions

### Running the Installer During Setup

1. Plug the USB drive with the scripts into your PC **before** booting the Windows installation media.
2. Boot into the Windows setup screen and press **Shift + F10** to open the Command Prompt.
3. In the Command Prompt, type `diskpart` and press Enter to run the disk partitioning tool.
4. Type `list volume` to identify the volume where the scripts are located.
5. Exit `diskpart` by typing `exit`.
6. Change to the script directory by typing the script volume drive letter, e.g., `D:` if your scripts are located on drive D.
7. Run `win-installer.bat` to begin the installation process.
8. Follow the on-screen prompts to complete the Windows installation.

### After Installation
- Once installation is complete, the system will automatically reboot.
- Remove the USB drive and installation media before the system fully restarts to avoid boot issues.

---

## Advanced Usage

**Customizing DISM Options**:  
The `dism.bat` script can be customized to apply different Windows editions, or to apply additional configurations. To do so, modify the relevant sections of `dism.bat` where the Windows edition and settings are defined.

---

## Contributing

We welcome contributions to **WinUtilsAutomator**! If you would like to add new utilities, improve the existing scripts, or help with documentation, feel free to:

1. Fork the repository.
2. Create a new branch for your changes.
3. Commit your changes with a descriptive message.
4. Open a pull request with a detailed description of the changes.

### Contribution Guidelines

- Ensure all scripts are tested before submission.
- Provide documentation for any new features.
- Adhere to the MIT License.

---

## License

**WinUtilsAutomator** is open-source and released under the MIT License.

---
