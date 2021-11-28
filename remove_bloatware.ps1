#This script removes Windows 10/11 bloatware. Comment certain packages out if you don't want them to get removed!


function 5secstoquit{
    Write-Output "Removing chosen default apps in 5 seconds...          Ctrl + c to quit"
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

# default Windows 10/11 apps
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "*Microsoft.Bing*"
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.FreshPaint"
    "Microsoft.GamingServices"
    "Microsoft.GamingApp"
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
    "Microsoft.Todos"
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
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.YourPhone"
    "*Microsoft.Zune*"
    "*office*"


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
    "NORDCURRENT.COOKINGFEVER"
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
    

# apps which cannot be removed using Remove-AppxPackage
    #"Microsoft.BioEnrollment"
    #"Microsoft.MicrosoftEdge"
    #"Microsoft.XboxGameCallableUI"


# apps which other apps depend on
    #"Microsoft.Advertising.Xaml"
)



Write-Output `n "Removing chosen default apps..." `n

foreach ($app in $apps) {    
    if (Get-AppxPackage -Name $app -AllUsers) {
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
        Write-Output "Removed $app" -ForegroundColor Green
    } else {
        Write-Output "$app is not present on the system" -ForegroundColor Yellow
    }
}

Write-Output `n "Done!" `n
