#This script removes Windows 10 bloatware. Comment certain packages out if you don't want them to get removed!


function 5secstoquit{
    Write-Output "Removing chosen default apps in 5 seconds...         Ctrl + c to quit"
    Start-Sleep 1

    $a = 5
    while ( $a -gt 1){
        $a--
        Write-Output "Removing chosen default apps in $a seconds...          Ctrl + c to quit"
        Start-Sleep 1
        }
}

5secstoquit

$apps = @(
# default Windows 10 apps
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "*Microsoft.Bing*"
    "Microsoft.FreshPaint"
    "Microsoft.GamingServices"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    #"Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    "*Microsoft.Xbox*"
    "Microsoft.YourPhone"
    "*Microsoft.Zune*"
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MSPaint"
    "Microsoft.WindowsReadingList"
    "Microsoft.MixedReality.Portal"
    "Microsoft.ScreenSketch"
    "*WindowsFeedback*"

# non-Microsoft
    "*PicsArt-PhotoStudio*"
    "*EclipseManager*"
    "*Netflix*"
    "*PolarrPhotoEditorAcademicEdition*"    
    "*Wunderlist*"
    "*LinkedInforWindows*"
    "*AutodeskSketchBook*"
    "*Twitter*"
    "*Disney*"
    "*MarchofEmpires*"
    "*Facebook.Facebook*"
    "*spotify*"
    "*king*"
    
    
    "ActiproSoftwareLLC.562882FEEB491"
    "CAF9E577.Plex"  
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Fitbit.FitbitCoach"
    "Flipboard.Flipboard"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "NORDCURRENT.COOKINGFEVER"
    "PandoraMediaInc.29680B314EFC2"
    "Playtika.CaesarsSlotsFreeCasino"
    "ShazamEntertainmentLtd.Shazam"
    "SlingTVLLC.SlingTV"
    "TheNewYorkTimes.NYTCrossword"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"
    "flaregamesGmbH.RoyalRevolt2"
    

    # apps which cannot be removed using Remove-AppxPackage
    #"Microsoft.BioEnrollment"
    #"Microsoft.MicrosoftEdge"
    #"Microsoft.Windows.Cortana"
    #"Microsoft.XboxGameCallableUI"
    #"Microsoft.XboxIdentityProvider"

    # apps which other apps depend on
    #"Microsoft.Advertising.Xaml"
)

Write-Output `n "Removing chosen default apps..." `n

foreach ($app in $apps) {
    Write-Output "Removing $app ..."

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

}
Write-Output `n "Done!" `n
