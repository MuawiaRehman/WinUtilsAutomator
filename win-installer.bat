@echo off
::===============================================
:: WINDOWS INSTALLER               
:: Batch Scripter: Muawia Rehman
:: Github: https://github.com/MuawiaRehman              
::===============================================

:menu
cls
color 0A
echo =============================================
echo            WINDOWS INSTALLER MENU         
echo =============================================
echo 1. Install Windows in UEFI Mode

echo 2. Install Windows in BIOS Mode

echo 3. Cancel Installation  

echo =============================================
set /p choice="Enter your choice (1-3): "
if "%choice%"=="1" goto start_uefi_installation
if "%choice%"=="2" goto start_bios_installation
if "%choice%"=="3" goto cancel

echo Invalid choice. Please try again. 
pause
goto menu

:start_uefi_installation
cls
color 0E
echo =============================================
echo Starting UEFI Windows Installation Process
echo =============================================
call disk-partitioning.bat UEFI
call dism.bat %efi_letter% %ntfs_letter%

:start_bios_installation
cls
color 0E
echo =============================================
echo Starting BIOS Windows Installation Process
echo =============================================
call disk-partitioning.bat BIOS
call dism.bat %ntfs_letter%

goto complete

:complete
cls
echo ============================================
echo Verifying installation...
wmic logicaldisk get caption,volumename,filesystem
echo The setup is complete.
echo ============================================
pause
exit /b

:cancel
color 0C
echo =============================================
echo        Windows Installation Cancelled         
echo =============================================
pause
exit /b

echo Press Return Key To Continue
pause
