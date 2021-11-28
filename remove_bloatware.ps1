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
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.FreshPaint"
    "Microsoft.GamingServices"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.MixedReality.Portal"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.OneConnect"
    "Microsoft.Paint"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.ScreenSketch"
    "Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.Wallet"
    "Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    "Microsoft.Windows.CloudExperienceHost"
    "microsoft.Windowscommunicationsapps"
    "Microsoft.Windows.ContentDeliveryManager"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.Windows.PeopleExperienceHost"
    "Microsoft.WindowsPhone"
    #"Microsoft.Windows.Photos"
    "Microsoft.WindowsReadingList"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    "*Microsoft.Xbox*"
    "Microsoft.YourPhone"
    "*Microsoft.Zune*"
    "*Office*"

# non-Microsoft
    "*ACGMediaPlayer*"
    "*ActiproSoftwareLLC*"
    "*AdobePhotoshopExpress*"
    "*Asphalt8Airborne*"
    "*AutodeskSketchBook*"
    "*BubbleWitch3Saga*"
    "*CandyCrush*"
    "ClearChannelRadioDigital.iHeartRadio"
    "*CyberLinkMediaSuiteEssentials*"
    "*Disney*"
    "*Dolby*"
    "*DrawboardPDF*"
    "*Duolingo-LearnLanguagesforFree*"
    "*EclipseManager*"
    "*Facebook*"
    "*FarmVille2CountryEscape*"
    "*FitbitCoach*"
    "*Flipboard*"
    "*HiddenCity*"
    "*Hulu*"
    "KeeperSecurityInc.Keeper"
    "*king.com*"
    "*LinkedInforWindows*"
    "*MarchofEmpires*"
    "*Minecraft*"
    "*Netflix*"
    "*OneCalendar*"
    "*PandoraMediaInc*"
    "*PicsArt-PhotoStudio*"
    "Playtika.CaesarsSlotsFreeCasino"
    "*Plex*"
    "*PolarrPhotoEditorAcademicEdition*"
    "*Royal Revolt*"
    "*RoyalRevolt2*"
    "*Shazam*"
    "*Speed Test*"
    "*Spotify*"
    "SlingTVLLC.SlingTV"
    "*Sway*"
    "TheNewYorkTimes.NYTCrossword"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "*Twitter*"
    "WinZipComputing.WinZipUniversal"
    "*Wunderlist*"
    "*XING*"
    
    
    
    "CAF9E577.Plex"  
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "Drawboard.DrawboardPDF"
    "Fitbit.FitbitCoach"
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
