
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

1. Place all batch scripts (`win-installer.bat`, `disk-partitioning.bat`, `dism.bat`) in the same directory.
2. Copy the scripts to a USB drive, pendrive, or any flashable disk.
3. Plug the USB drive into your PC **before** booting the Windows installation media.
4. Boot into the Windows setup screen, then press **Shift + F10** to open the command prompt.
5. Run `diskpart` to list the volumes by typing:  
   `list volume`  
   Identify the volume where the script is located.
6. Exit from `diskpart` and type the script volume drive letter:  
   `<volume letter:>`  
   You should now be in the script directory.
7. Run `win-installer.bat` to start the installation process.
8. Follow the on-screen instructions to complete the Windows installation.
9. Once installation is complete, exit the command prompt, close the Windows setup screen, and the system will reboot.
10. During the reboot, remove the USB drive and installation media.

## Requirements

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
