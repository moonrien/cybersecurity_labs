$sourceFolder = "$HOME\backup_data"
$backupFolder = "$HOME\backups"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$zipFile = "backup_$timestamp.zip"
$recipient = "dziegiel@example.com"
$zipPath = Join-Path $backupFolder $zipFile
$gpgPath = "$zipPath.gpg"
New-Item -ItemType Directory -Path $backupFolder -Force | Out-Null
Compress-Archive -Path $sourceFolder\* -DestinationPath $zipPath
& gpg.exe --yes --output $gpgPath --encrypt --recipient $recipient $zipPath
Remove-Item $zipPath
Write-Host "Backup finished and encrypted: $gpgPath"