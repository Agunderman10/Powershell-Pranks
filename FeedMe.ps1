#Powershell script that opens the disk drive and says "Feed Me" recursively every 60 seconds.
[CmdletBinding()]            
param([switch]$Eject, [switch]$Close) 
try 
{            
    $Diskmaster = New-Object -ComObject IMAPI2.MsftDiscMaster2            
    $DiskRecorder = New-Object -ComObject IMAPI2.MsftDiscRecorder2            
    $DiskRecorder.InitializeDiscRecorder($DiskMaster)            
    if ($Eject) 
    {            
     $DiskRecorder.EjectMedia()            
    } 
    elseif($Close) 
    {            
     $DiskRecorder.CloseTray()            
    }            
} 
catch 
{            
    Write-Error "Failed to operate the disk. Details : $_"            
}

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

while(1)
{
    $DiskRecorder.EjectMedia()
    #uncomment next line if you want to see different voices your operating system supports
    #$speak.GetInstalledVoices().VoiceInfo
    
    #uncomment next line if you want woman's voice, depending on if your operating system supports her voice.
    #you can change the voices by changing voice names below if you have multiple voices
    #$speak.SelectVoice('Microsoft Zira Desktop')
    $speak.Speak('feed me')
    $DiskRecorder.CloseTray()
    
    #this causes the program to wait for a minute before restarting, if you dont want it to stop simply delete this next line
    Start-Sleep -s 60
}
