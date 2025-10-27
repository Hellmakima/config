# "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

# profile
function prompt {
    # Get current path relative to home
    $homeRelative = $PWD.Path.Replace($HOME, '~')
    
    # Set green color for the path
    Write-Host "$homeRelative" -NoNewline -ForegroundColor Green
    Write-Host " $" -NoNewline
    return " "
}

# CMD where command alias
function wh { (Get-Command $args[0]).Source }

# Exit PowerShell on Ctrl+D
Set-PSReadLineKeyHandler -Chord "Ctrl+d" -BriefDescription "Exit on Ctrl+D" -ScriptBlock {
    [System.Environment]::Exit(0)
}

# touch for new file
Set-Alias touch New-Item

# make new dir and cd into it.
function mk {
    param(
        [Parameter(Mandatory=$true)]
        [string]$path
    )

    # Create the directory (like mkdir -p)
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }

    # cd into it
    Set-Location $path
}
# example usage `mk a/b/c`
