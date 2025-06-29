# BIOS & UEFI CLI ↔ GUI Parity Diagnostic Script
# Purpose: Mirrors msinfo32 output using PowerShell for BIOS auditing

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logPath = "$env:USERPROFILE\Desktop\BIOS_Audit_$timestamp.txt"

Start-Transcript -Path $logPath -Force

Write-Host "===== BIOS & UEFI DIAGNOSTIC TOOL =====" -ForegroundColor Cyan

# BIOS Info
$bios = Get-WmiObject Win32_BIOS
Write-Host "BIOS Manufacturer: $($bios.Manufacturer)"
Write-Host "BIOS Version: $($bios.SMBIOSBIOSVersion)"
Write-Host "BIOS Release Date: $($bios.ReleaseDate)"

# UEFI / Boot Mode Detection
try {
    $firmwareType = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name PEFirmwareType).PEFirmwareType
    switch ($firmwareType) {
        1 { Write-Host "Boot Mode: BIOS (Legacy)" -ForegroundColor Yellow }
        2 { Write-Host "Boot Mode: UEFI" -ForegroundColor Green }
        default { Write-Host "Boot Mode: Unknown ($firmwareType)" -ForegroundColor Red }
    }
} catch {
    Write-Host "Boot Mode: Could not determine." -ForegroundColor Red
}

# Secure Boot Detection
try {
    if (Confirm-SecureBootUEFI) {
        Write-Host "Secure Boot: ENABLED" -ForegroundColor Green
    } else {
        Write-Host "Secure Boot: DISABLED" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Secure Boot: Not available (Legacy BIOS)" -ForegroundColor Red
}

# Launch msinfo32 GUI in parallel (for screenshot comparison)
Start-Process "msinfo32"

Write-Host "\nSystem window (msinfo32) has been launched."
Write-Host "Results have also been saved to: $logPath"

Stop-Transcript
