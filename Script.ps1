Write-Host "Select path for the VMs"
Add-Type –AssemblyName System.Windows.Forms
$FileBrowserVM = New-Object System.Windows.Forms.FolderBrowserDialog
$Null = $FileBrowserVM.ShowDialog()
$FileBrowserVM.SelectedPath
Write-Host "Select path for the VHDs"
Add-Type –AssemblyName System.Windows.Forms
$FileBrowserVHD = New-Object System.Windows.Forms.FolderBrowserDialog
$Null = $FileBrowserVHD.ShowDialog()
$FileBrowserVHD.SelectedPath

Set-VMHost -VirtualHardDiskPath $FileBrowserVHD.SelectedPath -VirtualMachinePath $FileBrowserVM.SelectedPath

$Networkadapter = Read-Host "Type 1 for External adapter, Type 2 for Internal Adapter!!!"

If ($Networkadapter -eq 1)
{ 
 $Adaptername = Read-Host "Enter name for External Adapter!!! " 
 New-Vmswitch –Name $Adaptername –NetAdapterName Ethernet 
}
elseif ($Networkadapter -eq 2)
{
$Adaptername = Read-Host "Enter name for Internal Adapter!!! " 
New-VMSwitch -Name $Adaptername -SwitchType Internal
}
else
{
Write-Host "You have entered an invalid input!!!!!"
}

$Name = Read-Host "What is your VM name?"
$Generation = Read-Host "Which Generation of VM do you want (1 or 2)?"
$DiskType = Read-Host "What Disk Type do you want (Fixed or Dynamic)?"
$DiskSize = Read-Host "What Disk Space (in GB) do you want?"
$VHDPath = Read-Host "Enter path where .vhdx will reside (e.g., E:\VHD\)"
$VMPath = Read-Host "Enter path for VM config files (e.g., E:\VM\)"
$RAM = Read-Host "What RAM Size (in GB) do you require?"
$SwitchName = Read-Host "Please enter External virtual switch"

# Call the function with user inputs
New-VMConfiguration -Name $Name -Generation $Generation -DiskType $DiskType -DiskSizeInGB $DiskSize -VHDPath $VHDPath -VMPath $VMPath -RAM $RAM -SwitchName $SwitchName
