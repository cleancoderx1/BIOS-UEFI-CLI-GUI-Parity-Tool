# BIOS-UEFI-CLI-GUI-Parity-Tool
To automate BIOS diagnostics using PowerShell and compare them against the native GUI output

# 🔍 BIOS & UEFI CLI ↔ GUI Parity Tool

This project demonstrates how to mirror key system information from the Windows GUI (`msinfo32`) using a PowerShell diagnostic script.

## 🎯 Objective
To automate BIOS diagnostics using PowerShell and compare them against the native GUI output.

## 🧪 What It Does
- Reads BIOS version, vendor, and release date
- Detects UEFI vs Legacy boot mode
- Checks Secure Boot status
- Launches `msinfo32` for direct visual comparison
- Logs results to a timestamped file


## 🛠 How to Use
1. Download `bios_gui_cli_parity.ps1`
2. Right-click → Run with PowerShell (as Admin)
3. Observe `msinfo32` launch and compare outputs
4. Check your Desktop for a saved log file


## 📄 License
MIT
