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



Write-Host `n "Removing chosen default apps..." `n

foreach ($app in $apps) {    
    if (Get-AppxPackage -Name $app -AllUsers) {
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
        Write-Host "$($app.replace('*', '')) removed" -ForegroundColor Green
    } else {
        Write-Host "$($app.replace('*', '')) is not present on the system" -ForegroundColor Yellow
    }
}

function Pin-App {param(
        [string]$appname,
        [switch]$unpin
    )
    try{
        if ($unpin.IsPresent){
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'Von "Start" lösen|Unpin from Start'} | %{$_.DoIt()}
            return "App '$appname' unpinned from Start"
        }else{
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'An "Start" anheften|Pin to Start'} | %{$_.DoIt()}
            return "App '$appname' pinned to Start"
        }
    }catch{
        Write-Error "Error Pinning/Unpinning App! (App-Name correct?)"
    }
}

Pin-App "*spotify*" -unpin

Write-Host `n "Done!" `n
