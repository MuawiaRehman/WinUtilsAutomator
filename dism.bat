@echo off
::===============================================
:: WINDOWS DEPLOYMENT              
:: Batch Scripter: Muawia Rehman
:: Github: https://github.com/MuawiaRehman              
::===============================================

:: Get the passed parameters
set efi_letter=%1
set ntfs_letter=%2

:: Step 1: Selecting the ISO volume
echo.
color 0A
echo ============================================
echo Please enter the volume letter for the ISO volume (e.g., E):
echo Listing volumes...
(
    echo list volume
) | diskpart
echo ============================================
set /p iso_volume="Enter ISO volume letter (default E): "
if not defined iso_volume set iso_volume=E
color 0A
echo ISO volume letter set to: %iso_volume%
(
    echo select volume %iso_volume%
) | diskpart

:: Step 2: Check if install.wim file exists
color 0F
echo.
echo ============================================
echo Checking if install.wim exists...
set iso_path=%iso_volume%:\
cd /d %iso_path%sources
if not exist "install.wim" (
    color 0C
    echo ERROR: install.wim file not found in %iso_path%sources. Please verify the ISO.
    pause
    exit /b
) 
color 0A
echo install.wim found in %iso_path%sources.
echo ============================================

:: Step 3: Show available Windows editions
echo.
echo ============================================
echo Available Windows editions from install.wim:
echo ============================================
color 0F
dism /Get-ImageInfo /ImageFile=%iso_path%sources\install.wim

:: Step 4: Prompt user to manually enter the edition index
color 0F
echo.
set /p index="Enter the index of the Windows edition to install (refer to the list above): "
echo ============================================

:: Step 5: Apply the image to the NTFS partition
cls
color 0E

echo Checking NTFS and ISO paths...
echo ============================================
echo ISO Path: %iso_path%
echo Index: %index% - Windows Edition
echo NTFS Letter: %ntfs_letter%:\
echo ============================================
echo.
echo Applying image to %ntfs_letter%:\, please wait...
echo ==========================================================================================================================
echo ATTENTION: This process may take a while depending on the size of the image and the speed of your storage device.
echo So, Please do not press any key during the Deployment Image Servicing and Management process. Thank you for your patience.
echo ==========================================================================================================================

dism /apply-image /imagefile=%iso_path%sources\install.wim /index:%index% /applydir=%ntfs_letter%:\

if %errorlevel% neq 0 (
    color 0C
    echo ERROR: There was an issue applying the image to %ntfs_letter%:\.
    pause
    exit /b
)

color 0A
echo Image applied successfully.
echo ============================================

:: Step 6: Setup bootloader based on mode
color 0F
if defined efi_letter (
    echo Copying boot files to %efi_letter%:\ for UEFI mode...
    bcdboot %ntfs_letter%:\Windows /s %efi_letter%:\ /f ALL
) else (
    echo No need to set up bootloader for BIOS mode.
)

echo.
echo Boot files have been successfully copied to %efi_letter%:\ for UEFI mode.

pause
exit /b
