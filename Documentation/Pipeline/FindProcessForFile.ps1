$FileOrFolderPath = "C:\agents\_work\1\s\app\app\build\intermediates\dex\release\mergeDexRelease\classes.dex"

if ((Test-Path -Path $FileOrFolderPath) -eq $false) {
    Write-Warning "File or directory does not exist."       
}
else {
    $LockingProcess = CMD /C "openfiles /query /fo table | find /I ""$FileOrFolderPath"""
    Write-Host $LockingProcess
}

Read-Host -Prompt "Press Enter to exit"