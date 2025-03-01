function Copy-PowerShellConfig {
    param ([string] $ToPath)

    $srcFile = "Microsoft.PowerShell_profile.ps1"

    if (!(Test-Path -Path $ToPath)) {
        New-Item -ItemType "file" -Path $ToPath -Force | Out-Null
        Write-Host "Created new Microsoft.PowerShell_profile.ps1 at: $ToPath"
    }

    if (Test-Path $srcFile) {
        Copy-Item $srcFile -Destination $ToPath -Force | Out-Null # Force creates necessary folders when they don't exist
        Write-Host "$srcFile copied to $ToPath"
    }
    else {
        Write-Host "No PowerShell profile config ($srcFile) file found in repo."
    }
}

Copy-PowerShellConfig $PROFILE

. ./install-ohmyposh.ps1
#. ./install-wezterm.ps1
#Test-WeztermExists
