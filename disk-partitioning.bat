@echo off
::===============================================
:: DISK PARTITIONING SCRIPT           
:: Batch Scripter: Muawia Rehman
:: Github: https://github.com/MuawiaRehman              
::===============================================

:: Check the argument passed (UEFI or BIOS)
set install_mode=%1

cls
color 0A
echo =============================================
echo        Starting Disk Partitioning           
echo =============================================

:: List available disks
(
    echo list disk
) | diskpart

set /p disk_num="Enter the disk number to use: "

if /I "%install_mode%"=="UEFI" (
    goto partition_uefi
) else if /I "%install_mode%"=="BIOS" (
    goto partition_bios
) else (
    echo Invalid installation mode! Exiting...
    exit /b
)

:: UEFI Mode Partitioning
:partition_uefi
color 0E
echo Partitioning disk %disk_num% for UEFI installation...
(
    echo select disk %disk_num%
    echo clean
    echo convert gpt
    echo create partition efi size=500
    echo format fs=fat32 quick
    echo create partition primary
    echo format fs=ntfs quick
) | diskpart

:: List Volumes and ask user to assign letters for FAT32 and NTFS partitions
echo Listing volumes...
(
    echo list volume
) | diskpart

set /p efi_volume="Enter the volume number for FAT32 partition: "
set /p ntfs_volume="Enter the volume number for NTFS partition: "

:: Assign letters to FAT32 and NTFS partitions
set /p efi_letter="Enter FAT32 partition letter (default F): "
if not defined efi_letter set efi_letter=F
echo Assigning letter %efi_letter% to EFI partition...
(
    echo select volume %efi_volume%
    echo assign letter=%efi_letter%
) | diskpart

set /p ntfs_letter="Enter NTFS partition letter (default C): "
if not defined ntfs_letter set ntfs_letter=C
echo Assigning letter %ntfs_letter% to NTFS partition...
(
    echo select volume %ntfs_volume%
    echo assign letter=%ntfs_letter%
) | diskpart

goto done

:: BIOS Mode Partitioning
:partition_bios
color 0E
echo Partitioning disk %disk_num% for BIOS installation...
(
    echo select disk %disk_num%
    echo clean
    echo convert mbr
    echo create partition primary
    echo format fs=ntfs quick
) | diskpart

:: List Volumes and ask user to assign letters for NTFS partition
echo Listing volumes...
(
    echo list volume
) | diskpart

set /p ntfs_volume="Enter the volume number for NTFS partition: "

:: Assign letter to NTFS partition
set /p ntfs_letter="Enter NTFS partition letter (default C): "
if not defined ntfs_letter set ntfs_letter=C
echo Assigning letter %ntfs_letter% to NTFS partition...
(
    echo select volume %ntfs_volume%
    echo assign letter=%ntfs_letter%
) | diskpart

goto done

:done
color 0A
echo Disk partitioning completed successfully!
pause
exit /b 1