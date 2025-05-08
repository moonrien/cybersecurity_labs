# PowerShell backup & encryption script

  ## Description:

This script automates the backup and encryption of a specified directory on Windows using PowerShell and GPG. It compresses the source folder into a `.zip` file, encrypts it with a GPG public key, and securely deletes the unencrypted archive.

  ## Features:

- Compresses a specified folder into a `.zip` archive
- Encrypts the archive using GPG (public key encryption)
- Automatically deletes the unencrypted file after encryption
- Displays a confirmation message with the output file path


  ## What you'll need:

- PowerShell (Windows 10 or newer)
- [Gpg4win](https://gpg4win.org) or other GPG installation
- An existing GPG key pair (you can generate one using Kleopatra or `gpg --full-generate-key`)


  ## How to use:

1. Edit the `backup.ps1` file:
   - Set `$sourceFolder` to the directory you want to back up
   - Set `$recipient` to the email or key ID of your GPG public key

2. Open PowerShell in the project directory.

3. Run the script:
   ```powershell
   .\backup.ps1
   
*If you can't run the script due to Execution Policy, you can change it this way:
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  Y


4. The resulting encrypted backup file will be saved as:
   C:\Users\<username>\backups\backup_YYYYMMDD_HHMMSS.zip.gpg

5. To decrypt:
   gpg --output backup.zip --decrypt backup.zip.gpg


Author:
Moonrien
