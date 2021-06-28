# This script installs specified apps using winget
# Winget needs to be installed!


$apps = @(
  firefox
  spotify
)

Write-Output `n "Installing apps..." `n

foreach ($app in $apps) {

    winget install $app

}

Write-Output `n "Done!" `n
