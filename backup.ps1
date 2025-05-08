$sourceFolder = "$HOME\backup_data"
$backupFolder = "$HOME\backups"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$zipFile = "backup_$timestamp.zip"
$recipient = "example@example.com" # the mail you picked while creating encryption in Kleopatra
$zipPath = Join-Path $backupFolder $zipFile
$gpgPath = "$zipPath.gpg"
New-Item -ItemType Directory -Path $backupFolder -Force | Out-Null
Compress-Archive -Path $sourceFolder\* -DestinationPath $zipPath
& gpg.exe --yes --output $gpgPath --encrypt --recipient $recipient $zipPath
Remove-Item $zipPath
Write-Host "Backup finished and encrypted: $gpgPath"
