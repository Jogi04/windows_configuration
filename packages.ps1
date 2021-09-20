# This script installs specified apps using winget
# Winget needs to be installed!


$apps = @(
  Mozilla.Firefox
  Spotify.Spotify
  KeePassXCTeam.KeePassXC
  OpenVPNTechnologies.OpenVPNConnect
  #Dell.CommandUpdate
  #EpicGames.EpicGamesLauncher
)

Write-Output `n "Installing apps..." `n

foreach ($app in $apps) {
    winget install $app
}

Write-Output `n "Done!" `n
