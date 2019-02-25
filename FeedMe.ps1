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
    $speak.Speak('feed me')
    $DiskRecorder.CloseTray()
    Start-Sleep -s 60
}
