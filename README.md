# WinUtilsAutomator

**Version**: v1.0.0  
**Description**:  
**WinUtilsAutomator** is a collection of utilities and batch scripts designed to simplify and automate various Windows setup and configuration tasks.<br>The project includes a sub-project called <i>**WinBatchInstaller**</i>, which automates the Windows installation process in both UEFI and BIOS modes. It also provides functionality for disk partitioning and applying Windows images with the **DISM** tool. Over time, more utilities and tools will be added to the project.

---

## Sub-Project: WinBatchInstaller

**WinBatchInstaller** is a set of batch scripts focused on automating the Windows installation process. It handles disk partitioning, applying Windows images, and configuring bootloaders for both UEFI and BIOS modes.

### Included Scripts

#### 1. win-installer.bat
- Main script for starting the installation process.
- Allows users to choose between UEFI or BIOS installation modes.

#### 2. disk-partitioning.bat
- Handles partitioning of the selected disk for installation.
- Creates the necessary partitions depending on the selected installation mode (UEFI or BIOS).

#### 3. dism.bat
- Applies the Windows image to the selected partition.
- Configures the bootloader for the selected mode.

For more detailed installation instructions, please refer to the [Documentation](DOCUMENTATION.md) file.

---

## Contributing

Further improvements, enhancements, and additional Windows utilities are coming to this project.

---
