# "C:\Users\CROC\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

function wh { (Get-Command $args[0]).Source }

function prompt {
    # Get current path relative to home
    $homeRelative = $PWD.Path.Replace($HOME, '~')
    
    # Set green color for the path
    Write-Host "$homeRelative" -NoNewline -ForegroundColor Green
    Write-Host "$" -NoNewline
    return " "
}

