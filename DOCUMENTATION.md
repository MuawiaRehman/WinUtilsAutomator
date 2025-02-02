
---

# WinUtilsAutomator Documentation

**Version**: v1.0.0  
**Description**:  
This documentation provides detailed information on using and contributing to **WinUtilsAutomator**, a collection of batch scripts designed to automate Windows installation, disk partitioning, and configuration tasks. The project is built around the **DISM** tool and will expand with additional utilities over time.

---

## Table of Contents

1. [Overview](#overview)
2. [Script Details](#script-details)
   - [win-installer.bat](#win-installerbat)
   - [disk-partitioning.bat](#disk-partitioningbat)
   - [dism.bat](#dismbat)
3. [Installation and Setup](#installation-and-setup)
4. [Usage Instructions](#usage-instructions)
5. [Advanced Usage](#advanced-usage)
6. [Contributing](#contributing)
7. [License](#license)

---

## Overview

**WinUtilsAutomator** is a collection of batch scripts designed to automate the installation of Windows in either UEFI or BIOS mode, handle disk partitioning, apply Windows images, and configure bootloaders. The utility will continue to expand with more features, making it an all-in-one tool for Windows setup and configuration.

---

## Script Details

### win-installer.bat
The main script for managing the installation process. It presents the user with an interactive menu for selecting the installation mode (UEFI or BIOS), and allows cancellation of the installation.

- **UEFI Mode**: Sets up partitions in UEFI-compatible format.
- **BIOS Mode**: Uses MBR partitioning for legacy BIOS installations.

### disk-partitioning.bat
This script handles partitioning tasks based on the selected installation mode. It:

- Creates an EFI partition and a primary NTFS partition in **UEFI Mode**.
- Converts the disk to **MBR** and creates a single NTFS partition in **BIOS Mode**.

### dism.bat
This script applies the Windows image to the target disk:
- It extracts the appropriate edition from the `install.wim` file.
- It applies the Windows edition to the designated disk and configures the bootloader for UEFI or BIOS installation.

---

## Installation and Setup

1. **Download and Prepare**:  
   - Download the **WinUtilsAutomator** batch scripts (win-installer.bat, disk-partitioning.bat, dism.bat) from the GitHub repository.
   - Place all batch files in the same directory.
   - Copy these scripts to a USB flash drive or any removable media.

2. **Windows Installation Media**:  
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

