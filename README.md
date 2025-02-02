
---

# WinUtilsAutomator

**Version**: v1.0.0  
**Description**:  
WinUtilsAutomator is a collection of batch scripts designed to automate various Windows setup and configuration tasks, including the installation of Windows in either UEFI or BIOS mode. The scripts handle disk partitioning, applying Windows images.

## Included Scripts

### 1. win-installer.bat
This script serves as the main installer menu, allowing users to:
- Install Windows in UEFI Mode
- Install Windows in BIOS Mode
- Cancel the installation

### 2. disk-partitioning.bat
Handles the partitioning of the selected disk based on the chosen installation mode:
- **UEFI Mode**: Creates an EFI partition (500MB, FAT32) and a primary NTFS partition.
- **BIOS Mode**: Creates a single NTFS partition after converting the disk to MBR.

### 3. dism.bat
Deploys the Windows image to the NTFS partition:
- Extracts the Windows edition from `install.wim`
- Applies the selected Windows edition to the target disk
- Configures the bootloader for UEFI or BIOS installation

## Installation Instructions

For detailed installation instructions, please refer to the [Documentation](DOCUMENTATION.md) file.


## Requirements

- usb with the above scripts.
- Windows installation ISO mounted as a virtual drive.
- A target disk for installation.
- Administrator privileges.

## Notes

- Ensure the correct disk number is selected to prevent accidental data loss.
- The EFI partition letter defaults to F, and the NTFS partition letter defaults to C.

## License

This project is open-source and available under the MIT License.

## Contributing

Further improvements, enhancements, and additional Windows utilities are coming to this project. Feel free to contribute!
For more detailed instructions and guidance, see the [Documentation](DOCUMENTATION.md).

---
