$StartTime = Get-Date
New-Item C:\ClusterInfo -Type directory 	#Create the workbench directory
New-Item C:\ClusterInfo\ScriptTime.txt -ItemType file
Add-Content C:\ClusterInfo\ScriptTime.txt "Started:  $StartTime"
Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Cluster and Cluster Nodes Details..." -percentcomplete 5
Get-ClusterNode | SELECT Name | Export-Csv -LiteralPath C:\ClusterInfo\ClusterNodes1.Csv -Force -NoTypeInformation 	#Get all nodes of the cluster
(Get-Content C:\ClusterInfo\ClusterNodes1.Csv) | ForEach-Object {$_ -replace '"', ""} | Out-File -FilePath C:\ClusterInfo\ClusterNodes2.CSV -Force	#Remove Quotation Marks from above created file
(Get-Content C:\ClusterInfo\ClusterNodes2.Csv) | ForEach-Object {$_ -replace 'Name', ""} | Out-File -FilePath C:\ClusterInfo\ClusterNodes.CSV -Force	#Remove column title for above created file
Remove-Item C:\ClusterInfo\ClusterNodes1.Csv  
Remove-Item C:\ClusterInfo\ClusterNodes2.CSV

Rename-Item -Path C:\ClusterInfo\ClusterNodes.CSV -NewName C:\ClusterInfo\ClusterNodes.BAK
Select-String -Pattern "\w" -Path C:\ClusterInfo\ClusterNodes.BAK | ForEach-Object {$_.Line} | Set-Content -Path C:\ClusterInfo\ClusterNodes.CSV


Remove-Item C:\ClusterInfo\ClusterNodes.BAK

$htaCode = @"
<html>
    <head>
      <title>Cluster Information</title>
      <hta:application scroll="yes" windowState="Normal"
border="thick"
caption="yes"
showInTaskbar="yes">
   </head>
   <script language="VBScript">
Sub HandleRadioTest() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("ClusterDetails.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub 
Sub Ratio2() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("ClusterQuorum.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Ratio3() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("NodesNetworkSettings.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub CSVs() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("CSVsDetailed.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub ClusterNetworks() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("ClusterNetworks.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub DiskManagement() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-Disks-Detailed.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Uptime() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-Uptime.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub NamesModels() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-Names-and-Models-version.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub TagsBios() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-SvcTags-and-BIOS-version.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Apps() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("InstalledApplications.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Roles() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("InstalledRolesAndFeatures.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub AdvNet() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("NetAdapterAdvancedProperty.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub NetLBFO() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("NetLBFOConfiguration.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub PageFile() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-PageFileConfiguration.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub QFE() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("QFEHotfixes.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub VMSummary() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("VirtualMachinesSummary.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub VMDetailed() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("VirtualMachinesAll.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub VHDs() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("VirtualMachinesVirtualHardDisks.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub VMSwitches() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("VirtualSwitchesBasic.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub VMSwitchesDetailed() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("VirtualSwitchesDetailed.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub ClusterRoles() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("OtherClusterRoles.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Broadcom() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("BroadcomNICsDriversVersions.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Qlogic() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("QlogicNICsDriversVersions.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Intel() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("IntelNICsDriversVersions.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub AllNICs() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("AllNICsDriversVersions.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub CPUs() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("Nodes-CPUs.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub Drivers() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("FilesVersionsSummary.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
Sub memorydump() 
set oFSO=CreateObject("Scripting.FileSystemObject")
      set oFile=oFSO.OpenTextFile("MemoryDumpsInfo\MemoryDumpsInfo.txt",1)
      text=oFile.ReadAll
      document.all.ScriptArea.value=text
      oFile.Close
End Sub
   </script>
<style>
#header {
    background-color:#0052cc;
    color:white;
    text-align:right;
    padding:5px;
}
#nav {
    line-height:30px;
     background-color:#99ccff;
    height:768px;
    width:200px;
     float:left;
     padding:5px; 
}
#section {
    width:1000px;
    height:768px;
    float:left;
    padding:10px; 
    overflow: auto;
    white-space: nowrap;
}
#footer {
    background-color:#0052cc;
     color:white;
    clear:both;
    text-align:center;
     padding:5px; 
}
.container { width:1200px; overflow-x:auto; overflow-y:hidden; }
.wrapper { width: 1200px; }
</style> 
   <body>
<div id="header">
<h2>Cluster and Nodes Configuration and Information Details</h2>
</div>
<div class="container">
  <div class="wrapper">
<div id="nav">
<input type="radio" name="UserOption" value="1" onclick="HandleRadioTest">Cluster General Details<BR>
<input type="radio" name="UserOption" value="2" onclick="Ratio2">Quorum Configuration<BR>
<input type="radio" name="UserOption" value="3" onclick="Ratio3">Nodes Network Settings<BR>
<input type="radio" name="UserOption" value="3" onclick="CSVs">Cluster Shared Volumes<BR>
<input type="radio" name="UserOption" value="3" onclick="ClusterNetworks">Cluster Networks<BR>
<input type="radio" name="UserOption" value="3" onclick="DiskManagement">Disk Management (Nodes)<BR>
<input type="radio" name="UserOption" value="3" onclick="Uptime">Nodes Uptime<BR>
<input type="radio" name="UserOption" value="3" onclick="NamesModels">Nodes Names and Models<BR>
<input type="radio" name="UserOption" value="3" onclick="TagsBios">Nodes Svc Tags and BIOS<BR>
<input type="radio" name="UserOption" value="3" onclick="Apps">Installed Applications<BR>
<input type="radio" name="UserOption" value="3" onclick="Roles">Roles and Features<BR>
<input type="radio" name="UserOption" value="3" onclick="AdvNet">Adv Net Adapter Settings<BR>
<input type="radio" name="UserOption" value="3" onclick="NetLBFO">NIC Teaming Configuration<BR>
<input type="radio" name="UserOption" value="3" onclick="PageFile">Page File Configuration<BR>
<input type="radio" name="UserOption" value="3" onclick="QFE">QFE Hotfixes<BR>
<input type="radio" name="UserOption" value="3" onclick="VMSummary">VMs Summary<BR>
<input type="radio" name="UserOption" value="3" onclick="VMDetailed">VMs Detailed<BR>
<input type="radio" name="UserOption" value="3" onclick="VHDs">Virtual Hard Disks<BR>
<input type="radio" name="UserOption" value="3" onclick="VMSwitches">Virtual Switches<BR>
<input type="radio" name="UserOption" value="3" onclick="VMSwitchesDetailed">Virtual Switches Detailed<BR>
<input type="radio" name="UserOption" value="3" onclick="ClusterRoles">Cluster Roles<BR>
<input type="radio" name="UserOption" value="3" onclick="Broadcom">NIC Drivers: Broadcom<BR>
<input type="radio" name="UserOption" value="3" onclick="Qlogic">NIC Drivers: Qlogic<BR>
<input type="radio" name="UserOption" value="3" onclick="Intel">NIC Drivers: Intel<BR>
<input type="radio" name="UserOption" value="3" onclick="AllNICs">NIC Drivers: All<BR>
<input type="radio" name="UserOption" value="3" onclick="CPUs">Processors<BR>
<input type="radio" name="UserOption" value="3" onclick="Drivers">Drivers Versions<BR>
<input type="radio" name="UserOption" value="3" onclick="memorydump">Memory Dumps Info<BR>
</div>
<div id="section">
<textarea name="ScriptArea" rows=20 cols=115 readonly="yes"></textarea>
</div>
  </div>
</div>
<div id="footer">
 That's It
</div>
    </body>
 </html>
"@
New-Item C:\ClusterInfo\ClusterInfo.txt -ItemType file
Add-Content C:\ClusterInfo\ClusterInfo.txt $htaCode
Rename-Item -Path C:\ClusterInfo\ClusterInfo.txt -NewName C:\ClusterInfo\ClusterInfo.hta

$isS2DEnabled = (Get-Cluster).S2DEnabled
IF ($isS2DEnabled -eq 1)
{
Write-Progress -activity "Obtaining Cluster Information..." -status "Getting S2D Pool..." -percentcomplete 8
#Following 158 lines of code courtesy of https://blogs.technet.microsoft.com/filecab/2016/11/21/deep-dive-pool-in-spaces-direct/
Function ConvertTo-PrettyCapacity {
    Param (
        [Parameter(
            Mandatory = $True,
            ValueFromPipeline = $True
            )
        ]
    [Int64]$Bytes,
    [Int64]$RoundTo = 0,
    [Switch]$UseBaseTwo # Base-10 by Default
    )
    If ($Bytes -Gt 0) {
        $BaseTenLabels = ("bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
        $BaseTwoLabels = ("bytes", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB")
        If ($UseBaseTwo) {
            $Base = 1024
            $Labels = $BaseTwoLabels 
        }
        Else {
            $Base = 1000
            $Labels = $BaseTenLabels
        }
        $Order = [Math]::Floor( [Math]::Log($Bytes, $Base) )
        $Rounded = [Math]::Round($Bytes/( [Math]::Pow($Base, $Order) ), $RoundTo)
        [String]($Rounded) + $Labels[$Order]
    }
    Else {
        0
    }
    Return
}
Function ConvertTo-PrettyPercentage {
    Param (
        [Parameter(Mandatory = $True)]
            [Int64]$Numerator,
        [Parameter(Mandatory = $True)]
            [Int64]$Denominator,
        [Int64]$RoundTo = 1
    )
    If ($Denominator -Ne 0) { # Cannot Divide by Zero
        $Fraction = $Numerator/$Denominator
        $Percentage = $Fraction * 100
        $Rounded = [Math]::Round($Percentage, $RoundTo)
        [String]($Rounded) + "%"
    }
    Else {
        0
    }
    Return
}
Function Find-LongestCommonPrefix {
    Param (
        [Parameter(
            Mandatory = $True
            )
        ]
        [Array]$Array
    )
    If ($Array.Length -Gt 0) {
        $Exemplar = $Array[0]
        $PrefixEndsAt = $Exemplar.Length # Initialize
        0..$Exemplar.Length | ForEach {
            $Character = $Exemplar[$_]
            ForEach ($String in $Array) {
                If ($String[$_] -Eq $Character) {
                }
                Else {
                    $PrefixEndsAt = [Math]::Min($_, $PrefixEndsAt)
                }
            }
        }
        $Exemplar.SubString(0, $PrefixEndsAt)
    }
    Else {
    }
    Return
}
Function Reverse-String {
    Param (
        [Parameter(
            Mandatory = $True,
            ValueFromPipeline = $True
            )
        ]
        $String
    )
    $Array = $String.ToCharArray()
    [Array]::Reverse($Array)
    -Join($Array)
    Return
}
Function New-UniqueRootLookup {
    Param (
        [Parameter(
            Mandatory = $True
            )
        ]
        [Array]$Strings
    )
    $CommonPrefix = Find-LongestCommonPrefix $Strings
    $ReversedArray = @()
    ForEach($String in $Strings) {
        $ReversedString = $String | Reverse-String
        $ReversedArray += $ReversedString
    }
    $CommonSuffix = $(Find-LongestCommonPrefix $ReversedArray) | Reverse-String
    $Lookup = @{}
    ForEach($String in $Strings) {
        $Lookup[$String] = $String.Substring($CommonPrefix.Length, $String.Length - $CommonPrefix.Length - $CommonSuffix.Length)
    }
    $Lookup
    Return
}
$Nodes = Get-StorageSubSystem Cluster* | Get-StorageNode
$Drives = Get-StoragePool *S2D* | Get-PhysicalDisk
$Names = @()
ForEach ($Node in $Nodes) {
    $Names += $Node.Name
}
$UniqueRootLookup = New-UniqueRootLookup $Names
$Output = @()
ForEach ($Drive in $Drives) {
    If ($Drive.BusType -Eq "NVMe") {
        $SerialNumber = $Drive.AdapterSerialNumber
        $Type = $Drive.BusType
    }
    Else { # SATA, SAS
        $SerialNumber = $Drive.SerialNumber
        $Type = $Drive.MediaType
    }
    If ($Drive.Usage -Eq "Journal") {
        $Size = $Drive.Size | ConvertTo-PrettyCapacity
        $Used = "-"
        $Percent = "-"
    }
    Else {
        $Size = $Drive.Size | ConvertTo-PrettyCapacity
        $Used = $Drive.VirtualDiskFootprint | ConvertTo-PrettyCapacity
        $Percent = ConvertTo-PrettyPercentage $Drive.VirtualDiskFootprint $Drive.Size
    }
    $NodeObj = $Drive | Get-StorageNode -PhysicallyConnected
    If ($NodeObj -Ne $Null) {
        $Node = $UniqueRootLookup[$NodeObj.Name]
    }
    Else {
        $Node = "-"
    }
    $Output += [PSCustomObject]@{
        "SerialNumber" = $SerialNumber
        "Type" = $Type
        "Node" = $Node
        "Size" = $Size
        "Used" = $Used
        "Percent" = $Percent
    }
}

$Output | Sort Used, Node | FT -AutoSize | Out-File C:\ClusterInfo\S2DPool.txt -Encoding ascii -Width 2000
}
ELSE
{

}

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -Class Win32_bios -ComputerName $_ } | ft -AutoSize Manufacturer, serialnumber, SMBIOSBIOSVersion | Out-File C:\ClusterInfo\Nodes-SvcTags-and-BIOS-version.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -Class Win32_ComputerSystem -ComputerName $_ } | ft -AutoSize PSComputerName, Model | Out-File C:\ClusterInfo\Nodes-Names-and-Models-version.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -Class Win32_OperatingSystem -ComputerName $_} | ft -AutoSize CsName, @{LABEL='LastBootUpTime';EXPRESSION={$_.ConvertToDateTime($_.lastbootuptime)}} | Out-File C:\ClusterInfo\Nodes-Uptime.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -Class Win32_Processor -ComputerName $_ } | ft -AutoSize SystemName, Name, NumberOfCores, ProcessorId, NumberOfLogicalProcessors | Out-File C:\ClusterInfo\Nodes-CPUs.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Process and Memory Use Details..." -percentcomplete 9

New-Item C:\ClusterInfo\MemoryUtilization.txt -ItemType file
Add-Content C:\ClusterInfo\MemoryUtilization.txt `
"Memory Utilization Snapshot for Cluster Nodes`
==============================================`r`n";
Get-Content C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -Class Win32_OperatingSystem -Computer $_ | SELECT @{Name="Host Name";expression={$_.csname}},
@{Name="PM_Total (GB)";expression={[math]::round(($_.TotalVisibleMemorySize / 1047553),1)}},
@{Name="PM_Avail (GB)";expression={[math]::round(($_.FreePhysicalMemory / 1047553),1)}},
@{Name="VM_Total (GB)";expression={[math]::round(($_.TotalVirtualMemorySize / 1047553),1)}},
@{Name="PF_Total (GB)";expression={[math]::round(($_.SizeStoredInPagingFiles / 1047553),1)}},
@{Name="PF_InUse (GB)";expression={[math]::round(($_.SizeStoredInPagingFiles - $_.FreeSpaceInPagingFiles)/(1047553),1)}},
@{Name="PF_Free (GB)";expression={[math]::round(($_.FreeSpaceInPagingFiles / 1047553),1)}},
@{Name="VM_Free. (GB)";expression={[math]::round(($_.FreeVirtualMemory / 1047553),1)}},
@{name = "% Committed Bytes in Use";expression={[math]::round(([math]::round((($_.TotalVirtualMemorySize - $_.FreeVirtualMemory)/ 1047553),1)/([math]::round(($_.TotalVirtualMemorySize / 1047553),3))*100),1)}}} |
ft | Out-File C:\ClusterInfo\MemoryUtilization.txt -Encoding ascii -Width 5000 -Append


Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                               Get-Process Cluster Node:  $_";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-Process | Sort-Object -Property NPM -Descending  | ft -AutoSize `
Name, 
Handles, 
@{Name="WS (KB)";expression={[math]::round(($_.WS / 1024),0)}},
@{Name="PM (KB)";expression={[math]::round(($_.PM / 1024),0)}},
@{Name="NPM (KB)";expression={[math]::round(($_.NPM / 1024),0)}},
@{Name="CPU Time (s)";expression={[math]::round(($_.CPU),0)}},
Description}`
| Out-File C:\ClusterInfo\ProcessInformation.txt -Encoding ascii -Width 5000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Network Adapters Details..." -percentcomplete 10

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"Broadcom NIC Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver | WHERE {$_.Manufacturer -like "*Broadcom*"}} | Sort-Object -Property FriendlyName | ft -AutoSize PSComputerName, DeviceName, DriverVersion, DriverDate, InfName, isSigned, FriendlyName} | Out-File C:\ClusterInfo\BroadcomNICsDriversVersions.txt -Encoding ascii -Width 7000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"Qlogic NIC Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver | WHERE {$_.Manufacturer -like "*Qlogic*"}} | Sort-Object -Property FriendlyName | ft -AutoSize PSComputerName, DeviceName, DriverVersion, DriverDate, InfName, isSigned, FriendlyName} | Out-File C:\ClusterInfo\QlogicNICsDriversVersions.txt -Encoding ascii -Width 7000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"Intel NIC Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver | WHERE {$_.Manufacturer -like "*Intel*" -and $_.DeviceClass -like "*NET*"}} | Sort-Object -Property FriendlyName | ft -AutoSize PSComputerName, DeviceName, DriverVersion, DriverDate, InfName, isSigned, FriendlyName} | Out-File C:\ClusterInfo\IntelNICsDriversVersions.txt -Encoding ascii -Width 7000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"Mellanox NIC Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver | WHERE {$_.Manufacturer -like "*Mellanox*"}} | Sort-Object -Property FriendlyName | ft -AutoSize PSComputerName, DeviceName, DriverVersion, DriverDate, InfName, isSigned, FriendlyName} | Out-File C:\ClusterInfo\MellanoxNICsDriversVersions.txt -Encoding ascii -Width 7000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"Summary of All NIC Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver | WHERE {$_.DeviceClass -like "*NET*"}} | Sort-Object -Property FriendlyName | ft -AutoSize PSComputerName, DeviceName, DriverVersion, DriverDate, InfName, isSigned, FriendlyName} | Out-File C:\ClusterInfo\AllNICsDriversVersions.txt -Encoding ascii -Width 7000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                 Devices and Drivers Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
 Invoke-Command -ComputerName $_  {Get-WmiObject -Class Win32_PnPSignedDriver} | Sort-Object -Property DeviceClass | ft -AutoSize PSComputerName, DeviceName, DeviceClass, DriverVersion, DriverDate, DriverProviderName, InfName, isSigned, Manufacturer, Location} | Out-File C:\ClusterInfo\Devices_and_Drivers.txt -Encoding ascii -Width 7000

#HBA

function Get-HBAWin { 
param( 
[Switch]$LogOffline 
) 
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV  | ForEach-Object { 
try {

	$Computer = $_
	
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_";`
"                      FC ADAPTERS IN NODE:  $Computer ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`

	$Params = @{
		Namespace    = 'root\WMI'
		class        = 'MSFC_FCAdapterHBAAttributes'
		ComputerName = $Computer 
		ErrorAction  = 'Stop'
		}
	
	Get-WmiObject @Params  | ForEach-Object { 

			$hash=@{ 
				ComputerName     = $_.__SERVER 
				NodeWWN          = (($_.NodeWWN) | ForEach-Object {"{0:X2}" -f $_}) -join ":" 
				Active           = $_.Active 
				DriverName       = $_.DriverName 
				DriverVersion    = $_.DriverVersion 
				FirmwareVersion  = $_.FirmwareVersion 
				Model            = $_.Model 
				ModelDescription = $_.ModelDescription
                NumberOfPorts    = $_.NumberOfPorts 
                SerialNumber     = $_.SerialNumber
				} 
			New-Object psobject -Property $hash 
		}
}
catch {
	Write-Warning -Message "Error getting FC details for $Computer"
	if ($LogOffline)
	{
		"Error getting FC details for $Computer"
	}
}

}  
 
} Get-HBAWin | Out-File C:\ClusterInfo\Nodes-FCAdapterHBAAttributes.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Disks Details..." -percentcomplete 12

function GetNodesDisks { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_";`
"                      DISK MANAGEMENT VIEW IN NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-Disk -CimSession $_ | Sort-Object Number | ft -AutoSize Number, @{N="Label";E={$_.FriendlyName}}, @{N="Size (GB)";E={"{0:N0}" -f ($_.Size/1024/1024/1024)}}, BusType, @{N="Status";E={$_.OperationalStatus}}, @{N="Partitions";E={$_.NumberOfPartitions}} , PartitionStyle, IsBoot, IsClustered, IsSystem
    } 
catch   
    { 
Write-Warning "An error occurred getting the DiskManagement View for:$_" 
    } } } GetNodesDisks | Out-File C:\ClusterInfo\Nodes-Disks-Detailed.txt -Encoding ascii -Width 3000

function GetNodesPartitions { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_";`
"                      PARTITIONS VIEW IN NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-Partition -CimSession $_ | Sort-Object DiskNumber | ft -AutoSize @{N="Id";E={$_.DiskNumber}}, DriveLetter, @{N="Size (GB)";E={"{0:N0}" -f ($_.Size/1024/1024/1024)}}, MbrType, GptType, Type, AccessPaths
    } 
catch   
    { 
Write-Warning "An error occurred getting the Parition Information for:$_" 
    } } } GetNodesPartitions | Out-File C:\ClusterInfo\Nodes-Partitions-Detailed.txt -Encoding ascii -Width 3000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
Get-CimInstance -ClassName Win32_Volume | ft -AutoSize SystemName, Name, BlockSize, Automount, @{N="Capacity (GB)";E={"{0:N0}" -f ($_.Capacity/1024/1024/1024)}}, DriveLetter, FileSystem, FreeSize, SerialNumber
} | Out-File C:\ClusterInfo\Nodes_Volumes.txt -Append -Encoding ascii -Width 2000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Kernel Drivers Details..." -percentcomplete 18

New-Item C:\ClusterInfo\FilesVersionsSummary.txt -ItemType file

Add-Content C:\ClusterInfo\FilesVersionsSummary.txt "File Versions in Cluster Nodes"
$Query = "SELECT * FROM CIM_DataFile WHERE (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='storport' AND Extension='sys') `
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='vmswitch' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='msiscsi' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='mpio' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='volsnap' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='msdsm' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='ntfs' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='dfsc' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='tcpip' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='afd' AND Extension='sys')`
OR (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND FileName='clusdisk' AND Extension='sys')`
" 
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -ComputerName $_ -Query $Query}`
 |  Sort-Object -Property Name `
 | ft -AutoSize @{N='ClusterNode';E={$_.CSName}}, @{N='File Path & Name';E={$_.Name}}, Version `
 | Out-File C:\ClusterInfo\FilesVersionsSummary.txt -Append -Encoding ascii




$a = "<style>"
$a = $a + "BODY{background-color:LightGray;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: LightGray;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: DarkGray;}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: DarkGray;}"
$a = $a + "</style>"

$Query = "SELECT * FROM CIM_DataFile WHERE (Drive ='C:' AND Path='\\Windows\\System32\\Drivers\\' AND Extension='sys')" ` 
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WmiObject -ComputerName $_ -Query $Query}`
 | Sort-Object -Property Name `
 | Select-Object @{N='ClusterNode';E={$_.CSName}}, @{N='File Path & Name';E={$_.Name}}, Version `
 | ConvertTo-HTML -head $a | Out-File C:\ClusterInfo\FilesVersionsAll.htm

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Network Configuration Details..." -percentcomplete 25

New-Item C:\ClusterInfo\NodesNetworkSettings.txt -ItemType file


Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      NETWORK ADAPTERS IN CLUSTER NODE:  $_ `r`n";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`

Get-WmiObject -Class win32_NetworkAdapterSetting -ComputerName $_ |
Foreach-object `
{
  If( ([wmi]$_.element).netconnectionstatus -eq 2)
    {
     [wmi]$_.element | fl @{N='Label';E={$_.NetconnectionID}}, @{N='Device Name    ';E={$_.ProductName}} #NetworkAdapter
     [wmi]$_.setting | fl IPAddress, IPSubnet, DHCPEnabled, @{N='Gateway';E={$_.DefaultIPGateway}}, @{N='DNS Servers    ';E={$_.DNSServerSearchOrder}}, MACAddress #NetworkAdapterConfiguration
     [wmi]$_.element | fl @{N='Manufacturer   ';E={$_.Manufacturer}}, @{N='Speed (Gb/s)';E={"{0:N1}" -f ($_.Speed/1000000000)}}
     "_`r`n_`r`n" ;
    } #end if  
 } 
 } | Out-File C:\ClusterInfo\NodesNetworkSettings.txt -Append -Encoding ascii
Rename-Item -Path C:\ClusterInfo\NodesNetworkSettings.txt -NewName C:\ClusterInfo\NodesNetworkSettings.BAK
Select-String -Pattern "\w" -Path C:\ClusterInfo\NodesNetworkSettings.BAK | ForEach-Object {$_.Line} | Set-Content -Path C:\ClusterInfo\NodesNetworkSettings.txt

Remove-Item C:\ClusterInfo\NodesNetworkSettings.BAK
  
Get-Cluster | fl * | Out-File C:\ClusterInfo\ClusterDetails.txt -Encoding ascii

$ClusterName = Get-Cluster

Get-ClusterQuorum -Cluster $ClusterName | ft -AutoSize Cluster, QuorumType, QuorumResource | Out-File C:\ClusterInfo\ClusterQuorum.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Clustered Resources Details..." -percentcomplete 35

Get-ClusterGroup -Cluster $ClusterName | ? {$_.GroupType –eq 'VirtualMachine' } | Get-VM | ft -AutoSize VMName, @{N="Host";E={$_.ComputerName}}, @{N="vCPUCount";E={$_.ProcessorCount}}, State, CPUUsage, @{N="RAM (GB)"; E= { "{0:N0}" -f ($_.MemoryAssigned/1024/1024/1024) }}, Uptime, ReplicationState, ConfigurationLocation  | Out-File C:\ClusterInfo\VirtualMachinesSummary.txt -Encoding ascii -Width 5000
Get-ClusterGroup -Cluster $ClusterName | ? {$_.GroupType –eq 'VirtualMachine' } | Get-VM | fl * | Out-File C:\ClusterInfo\VirtualMachinesAll.txt -Encoding ascii
Get-ClusterGroup -Cluster $ClusterName | ? {$_.GroupType –ne 'VirtualMachine' } | ft -AutoSize | Out-File C:\ClusterInfo\OtherClusterRoles.txt -Encoding ascii
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-VM –ComputerName $_ | Get-VMHardDiskDrive | ft -AutoSize VMName, @{N="Host";E={$_.ComputerName}}, ControllerType, ControllerNumber, ControllerLocation, Path} | Out-File C:\ClusterInfo\VirtualMachinesVirtualHardDisks.txt -Encoding ascii -Width 2000
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {"Not Clustered VMs Found in Host $_ `r`n"; Get-VM -ComputerName $_ | Where-Object {$_.isClustered -ne "True"} | ft -AutoSize Name, ComputerName, State, CPUUsage, MemoryAssigned, Path, ConfigurationLocation } | Out-File C:\ClusterInfo\VirtualMachinesNotClusteredSummary.txt -Encoding ascii -Width 2000
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {"Not Clustered VMs Found in Host $_ `r`n"; Get-VM -ComputerName $_ | Where-Object {$_.isClustered -ne "True"} | fl * } | Out-File C:\ClusterInfo\VirtualMachinesNotClusteredAll.txt -Encoding ascii -Width 2000

Get-ClusterNetwork -Cluster $ClusterName| ft -AutoSize Name, State, Role, Autometric, Metric, Address, AddressMask | Out-File C:\ClusterInfo\ClusterNetworks.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Cluster Logs..." -percentcomplete 52

Get-ClusterLog -Cluster $ClusterName -TimeSpan 1440 -Destination C:\ClusterInfo\

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-VMSwitch -ComputerName $_ | ft ComputerName, Name, SwitchType, AllowManagementOS -AutoSize} | Out-File C:\ClusterInfo\VirtualSwitchesBasic.txt -Encoding ascii
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-VMSwitch -ComputerName $_ | fl *} | Out-File C:\ClusterInfo\VirtualSwitchesDetailed.txt -Encoding ascii

function GetVmAdaptersBasic { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_";`
"                                VIRTUAL NETWORK ADAPTERS IN NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-VMNetworkAdapter -ComputerName $_ -All | Sort-Object IsManagementOs | ft -AutoSize IsManagementOs, VMName, SwitchName, Connected, VMQUsage, VMQWeight, Name, IsLegacy, @{N="DynamicMAC";E={$_.DynamicMacAddressEnabled}}
    } 
catch   
    { 
Write-Warning "An error occurred getting the Parition Information for:$_" 
    } } } GetVmAdaptersBasic | Out-File C:\ClusterInfo\VirtualNetworkAdaptersBasic.txt -Encoding ascii -Width 3000

    function GetVmAdaptersAdvanced { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_";`
"                     VIRTUAL NETWORK ADAPTERS IN NODE:  $_ (ADVANCED INFO)";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-VMNetworkAdapter -ComputerName $_ -All | fl Name, IsManagementOs, VMName, SwitchName, CurrentIsolationMode, DhcpGuard, RouterGuard, PortMirroringMode, IeeePirorityTag, VirtualSubnetId, AllowTeaming, BandwidthPercentage
    } 
catch   
    { 
Write-Warning "An error occurred getting the Parition Information for:$_" 
    } } } GetVmAdaptersAdvanced | Out-File C:\ClusterInfo\VirtualNetworkAdaptersAdvanced.txt -Encoding ascii -Width 3000

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-VM –ComputerName $_ | Get-VMHardDiskDrive | ft -AutoSize VMName, ComputerName, ControllerType, ControllerNumber, ControllerLocation, Path} | Out-File C:\ClusterInfo\VirtualMachinesVirtualHardDisks.txt -Encoding ascii -Width 5000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Cluster Shared Volumes Information..." -percentcomplete 57

Get-ClusterSharedVolume -Cluster $ClusterName | ft -AutoSize | Out-File C:\ClusterInfo\CSVs.txt  -Encoding ascii

$objs = @()
$csvs = Get-ClusterSharedVolume
foreach ( $csv in $csvs )
{
   $csvinfos = $csv | select -Property Name -ExpandProperty SharedVolumeInfo
   foreach ( $csvinfo in $csvinfos )
   {
      $obj = New-Object PSObject -Property @{
         Name        = $csv.Name
         Path        = $csvinfo.FriendlyVolumeName
         Size        = $csvinfo.Partition.Size
         FreeSpace   = $csvinfo.Partition.FreeSpace
         UsedSpace   = $csvinfo.Partition.UsedSpace
         PercentFree = $csvinfo.Partition.PercentFree
      }
      $objs += $obj
   }
}

$objs | ft -auto Name,Path,@{ Label = "Size(GB)" ; Expression = { "{0:N2}" -f ($_.Size/1024/1024/1024) } },@{ Label = "FreeSpace(GB)" ; Expression = { "{0:N2}" -f ($_.FreeSpace/1024/1024/1024) } },@{ Label = "UsedSpace(GB)" ; Expression = { "{0:N2}" -f ($_.UsedSpace/1024/1024/1024) } },@{ Label = "PercentFree" ; Expression = { "{0:N2}" -f ($_.PercentFree) } } | Out-File C:\ClusterInfo\CSVsDetailed.txt -Encoding ascii -Width 5000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Recent System Log Warning/Error Events..." -percentcomplete 67

$ThreeDayTimeSpan = (Get-Date) - (New-TimeSpan -Day 9)
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WinEvent -ComputerName $_ -FilterHashTable @{LogName='System'; Level=3,2,1; StartTime=$ThreeDayTimeSpan} |  Select LevelDisplayName, TimeCreated, ProviderName, Id, MachineName, @{n='Message';e={$_.Message -replace '\s+', " "}} | Export-Csv -Path C:\ClusterInfo\SystemEventLog_3daysWarningsAndErrors_for_$_.txt -NoTypeInformation}

Get-childItem "C:\ClusterInfo\SystemEventLog*.txt" | foreach {[System.IO.File]::AppendAllText("C:\ClusterInfo\CombinedEventLogWarningsAndEvents.csv", [System.IO.File]::ReadAllText($_.FullName))}

#All System EventLog
# Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WinEvent -ComputerName $_ -FilterHashTable @{LogName='System'; Level=4,3,2,1} |  Select LevelDisplayName, TimeCreated, ProviderName, Id, MachineName, @{n='Message';e={$_.Message -replace '\s+', " "}} | Export-Csv -Path C:\ClusterInfo\SystemEventLogAll_for_$_.CSV -NoTypeInformation}

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Memory Dump Configuration" -percentcomplete 71

New-Item -Name MemoryDumpsInfo -ItemType Directory -Path C:\ClusterInfo
New-Item -Name MemoryDumpsInfo.txt  -ItemType File -Path C:\ClusterInfo\MemoryDumpsInfo
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
$path = Test-Path "\\$_\C$\Windows\MiniDump\*"
if ($path -eq 'True') { Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MiniDumps Discovered in Cluster Node $_..."; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; New-Item -Name $_ -ItemType Directory -Path C:\ClusterInfo\MemoryDumpsInfo ; Copy-Item \\$_\C$\Windows\MiniDump\*.dmp C:\ClusterInfo\MemoryDumpsInfo\$_; Get-ChildItem \\$_\C$\Windows\MiniDump | Out-File C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Append -Encoding ascii -Width 5000}
else
{ Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MiniDumps Discovered in Cluster Node $_..."; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "   *** A directory named 'MiniDump' does not exist in 'C:\Windows' or there are no memory dump files in 'C:\Windows\MiniDump' ***"; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " ";}
}

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
$path = Test-Path "\\$_\C$\Windows\MEMORY.DMP"
if ($path -eq 'True') { Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MEMORY.DMP Discovered in Cluster Node $_..."; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Get-Item \\$_\C$\Windows\MEMORY.DMP | Out-File C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Append -Encoding ascii -Width 5000}
else
{ Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MEMORY.DMP Discovered in Cluster Node $_..."; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "   *** A file named MEMORY.DMP does not exist in 'C:\Windows' ***"; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " ";}
}
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
$srv = $_
$key = "SYSTEM\CurrentControlSet\Control\CrashControl"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$regKey = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type, $Srv)
$regKey = $regKey.OpenSubKey($key)
$LogEvent = $regKey.GetValue('LogEvent')
$OverWrite = $regKey.GetValue('Overwrite')
$AutoReboot = $regKey.GetValue('AutoReboot')
$DumpFile = $regKey.GetValue('DumpFile')
$DisableEmoticon = $regKey.GetValue('DisableEmoticon')
$CrashDumpEnabled = $regKey.GetValue('CrashDumpEnabled')
$MiniDumpDir = $regKey.GetValue('MiniDumpDir')
$MiniDumpsCount = $regKey.GetValue('MinidumpsCount')
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "Crash Control configuration in Host $_..." ; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "LogEvent            $LogEvent"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "Overwrite           $Overwrite"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "AutoReboot          $AutoReboot"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "DumpFile            $DumpFile"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "DisableEmoticon     $DisableEmoticon"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "CrashDumpEnabled    $CrashDumpEnabled"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MiniDumpDirectory   $MiniDumpDir"
Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value "MiniDumpsCount      $MiniDumpsCount" ; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "; Add-Content -Path C:\ClusterInfo\MemoryDumpsInfo\MemoryDumpsInfo.txt -Value " "
}

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Validation Reports" -percentcomplete 72
New-Item -Name ValidationReports -ItemType Directory -Path C:\ClusterInfo
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
$Valpath = Test-Path "\\$_\C$\Windows\Cluster\Reports\Validation Report*"
if ($Valpath -eq 'True') {New-Item -Name $_ -ItemType Directory -Path C:\ClusterInfo\ValidationReports ;Copy-Item \\$_\C$\Windows\Cluster\Reports\*.htm C:\ClusterInfo\ValidationReports\$_ ; Get-ChildItem \\$_\C$\Windows\Cluster\Reports} else {}}

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Quick Fix Engineering Updates" -percentcomplete 77

function QFEHotfixes { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
Get-HotFix -ComputerName $_ | Select-Object PSComputerName,HotFixID,Description,InstalledBy,InstalledOn | FT -AutoSize  
    } 
catch   
    { 
Write-Warning "An error occurred getting the QFE report for:$_" 
    } } } QFEHotfixes | Out-File C:\ClusterInfo\QFEHotfixes.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-NetAdapterAdvancedProperty -CimSession $_ | ft -AutoSize @{N='ClusterNode';E={$_.PSComputerName}}, @{N='Adapter Label';E={$_.Name}}, @{N='Property Name';E={$_.DisplayName}}, @{N='Value';E={$_.DisplayValue}}, RegistryKeyword, RegistryValue } | Out-File C:\ClusterInfo\NetAdapterAdvancedProperty.txt -Encoding ascii
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-NetAdapterHardwareInfo -CimSession $_ | fl *} | Out-File C:\ClusterInfo\NetAdapterHardwareInfo.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Installed Roles and Features" -percentcomplete 79

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {"Installed Roles and Features in ClusterNode $_"; Get-WindowsFeature -ComputerName $_| Where Installed | Sort-Object Parent | ft -AutoSize DisplayName, Parent, Installed, InstallState, Path } | Out-File C:\ClusterInfo\InstalledRolesAndFeatures.txt -Encoding ascii -Width 5000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Installed Applications" -percentcomplete 82

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      INSTALLED APPLICATIONS IN CLUSTER NODE:  $_ `r`n";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-WmiObject -Class Win32_Product -ComputerName $_} | ft -AutoSize Name, Version, Vendor | Out-File C:\ClusterInfo\InstalledApplications.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting NetLBFO Config..." -percentcomplete 84

function NetLBFOConfig { Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object { try  
    { 
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      NIC TEAMS IN CLUSTER NODE:  $_ `r`n";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-NetLbfoTeam -CimSession $_ | fl Name, Members, TeamingMode, LoadBalancingAlgorithm, Status, TeamNics
Get-NetLbfoTeamNic -CimSession $_  | fl @{N="InterfaceDescription  ";E={$_.InterfaceDescription}}, VlanID
    } 
catch   
    { 
Write-Warning "An error occurred getting the NetLBFO Config for:$_" 
    } } } NetLBFOConfig | Out-File C:\ClusterInfo\NetLBFOConfiguration.txt -Encoding ascii

Rename-Item -Path C:\ClusterInfo\NetLBFOConfiguration.txt -NewName C:\ClusterInfo\NetLBFOConfiguration.BAK
Select-String -Pattern "\w" -Path C:\ClusterInfo\NetLBFOConfiguration.BAK | ForEach-Object {$_.Line} | Set-Content -Path C:\ClusterInfo\NetLBFOConfiguration.txt
Remove-Item C:\ClusterInfo\NetLBFOConfiguration.BAK

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting iSCSI Initiator/Target Info..." -percentcomplete 85

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                 Get-iSCSIConnection - iSCSI Initiator/Target Info for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-IscsiConnection -CimSession $_ | ft -AutoSize ConnectionIdentifier, InitiatorAddress, InitiatorPortNumber, TargetAddress, TargetPortNumber} `
| Out-File C:\ClusterInfo\iSCSI_Initiator_Target_Info.txt -Encoding ascii -Width 5000


Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Get-iSCSISession Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-IscsiSession |ft -AutoSize InitiatorPortalAddress, InitiatorNodeAddress, IsConnected, IsPersistent, IsDiscovered, NumberOfConnections, TargetNodeAddress, AuthenticationType}} `
| Out-File C:\ClusterInfo\iSCSI_Initiator_Target_Info.txt -Encoding ascii -Width 5000 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Get-iSCSITarget Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-IscsiTarget |ft -AutoSize NodeAddress, IsConnected}} `
| Out-File C:\ClusterInfo\iSCSI_Initiator_Target_Info.txt -Encoding ascii -Width 5000 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Get-iSCSITargetPortal Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-IscsiTargetPortal |ft -AutoSize TargetPortalAddress, TargetPortalPortNumber}} `
| Out-File C:\ClusterInfo\iSCSI_Initiator_Target_Info.txt -Encoding ascii -Width 5000 -Append


Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                     Jumbo Packet PING FROM NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ { `
 $Targets = Get-IscsiConnection | select -ExpandProperty  TargetAddress -Unique
 foreach ($Target in $Targets) {
 if ($Target -eq "0.0.0.0") {}
 else {
 Write-Host "iSCSI Target " $Target -ForegroundColor Cyan
 "Testing PING with jumbo packets to iSCSI Target: " + $Target + "..."
 $TargetIPThreeOctets = (([ipaddress] $Target).GetAddressBytes()[0..2] -join ".") + "."
 Write-Host "Searching host for IP Addresses that look like: " $TargetIPThreeOctets -ForegroundColor Yellow
 $iScsiIps = Get-NetIPAddress | Where-Object {$_.IPv4Address -like $TargetIPThreeOctets + "*"}
 Write-Host "Found " $iScsiIps
 foreach ($iScsiIp in $iScsiIps) {
 Write-Host "Attempting to reach iSCSI target " $Target "from iSCSI Interface " $iScsiIp -ForegroundColor Cyan
 ping -S $iScsiIp -f -l 8192 $Target
 }}}}} | Out-File C:\ClusterInfo\iSCSI_Interfaces_JumboFramesTest.txt -Encoding ascii -Width 5000 -Append


Write-Progress -activity "Obtaining Cluster Information..." -status "Getting PageFile Configuration..." -percentcomplete 86

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      PAGE FILE INFORMATION FOR CLUSTER NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-WmiObject Win32_PageFileusage -ComputerName $_ } | fl Name, @{N="Size (GB)";E={$_.AllocatedBaseSize/1024}},@{N="Highest Use (MB)";E={$_.PeakUsage}},CurrentUsage `
| Out-File C:\ClusterInfo\Nodes-PageFileConfiguration.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
Write-Progress -activity "Gathering Performance Data..." -status "Capturing Performance Counters on Node $_ for 30 seconds..." -percentcomplete 90 ;
Get-Counter -ComputerName $_ -Counter "\PhysicalDisk(*)\*", "\Processor(*)\*", "\Memory\*", "\Network Interface(*)\*", "\Network Adapter(*)\*", "\System\*" -SampleInterval 1 -MaxSamples 1 | Export-counter -Path C:\ClusterInfo\Performance_$_.blg -Force -FileFormat "BLG"}

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Group Policy Info..." -percentcomplete 91

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      MPCLAIM Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"MPCLAIM.EXE -h";`
Invoke-Command -ComputerName $_ {MPClaim.exe -h};`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"MPCLAIM.EXE -s -d";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d};`
"MPCLAIM.EXE -e";`
Invoke-Command -ComputerName $_ {MPClaim.exe -e};`
"MPCLAIM.EXE -s -d 0";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 0};`
"MPCLAIM.EXE -s -d 1";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 1};`
"MPCLAIM.EXE -s -d 2";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 2};`
"MPCLAIM.EXE -s -d 3";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 3};`
"MPCLAIM.EXE -s -d 4";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 4};`
"MPCLAIM.EXE -s -d 5";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 5};`
"MPCLAIM.EXE -s -d 6";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 6};`
"MPCLAIM.EXE -s -d 7";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 7};`
"MPCLAIM.EXE -s -d 8";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 8};`
"MPCLAIM.EXE -s -d 9";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 9};`
"MPCLAIM.EXE -s -d 10";`
Invoke-Command -ComputerName $_ {MPClaim.exe -s -d 10};`
} `
| Out-File C:\ClusterInfo\MPCLAIM_Info.txt -Encoding ascii -Width 3000

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Group Policy Info..." -percentcomplete 92

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      GPRESULT /R for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Gpresult /R}} `
| Out-File C:\ClusterInfo\GPRESULT_Info.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting SystemInfo Report..." -percentcomplete 93

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      System Information Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {systeminfo}} `
| Out-File C:\ClusterInfo\SystemInfo_Info.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Winver Information Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-Item -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion'}} `
| Out-File C:\ClusterInfo\Winver_Info.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      WindowsUpdate Information Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-ChildItem -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows' -Recurse}} `
| Out-File C:\ClusterInfo\WindowsUpdate_Reg_Info.txt -Encoding ascii

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {Get-WinEvent -ComputerName $_ -FilterHashTable @{LogName='System'; Id=6008,41,1074} |  Select LevelDisplayName, TimeCreated, ProviderName, Id, MachineName, @{n='Message';e={$_.Message -replace '\s+', " "}} | Export-Csv -Path C:\ClusterInfo\UptimeHistory_$_.txt -NoTypeInformation }
Get-childItem "C:\ClusterInfo\UptimeHistory*.txt" | foreach {[System.IO.File]::AppendAllText("C:\ClusterInfo\CombinedUptimeHistory.csv", [System.IO.File]::ReadAllText($_.FullName))}


Write-Progress -activity "Obtaining Cluster Information..." -status "Getting FS MiniFilter Drivers..." -percentcomplete 94

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      FS MiniFilter Drivers Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {fltmc}} `
| Out-File C:\ClusterInfo\fltmc_Info.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Verifier.exe Settings..." -percentcomplete 95

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Verifier.EXE settings Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {verifier /query}} `
| Out-File C:\ClusterInfo\Verifier_Info.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting TCPIP Info..." -percentcomplete 96

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Routing Table Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {route print} ;
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Netstat NATO Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {netstat -nato} ;
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      Netsh tcp show global Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {netsh int tcp show global} ;
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      arp -a Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {arp -a} ;
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      IPConfig /All Report for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {ipconfig /all}} `
| Out-File C:\ClusterInfo\TCPIP_Netsh_Info.txt -Encoding ascii

Write-Progress -activity "Obtaining Cluster Information..." -status "Getting Registry Information..." -percentcomplete 97

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-            HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /s}} `
| Out-File C:\ClusterInfo\Reg_HKLM_Uninstall.txt -Encoding ascii -Width 5000 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces /s}} `
| Out-File C:\ClusterInfo\Reg_HKLM_TcpIpParams.txt -Encoding ascii -Width 5000 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {reg query HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters /s}} `
| Out-File C:\ClusterInfo\Reg_HKLM_LanmanWorkParams.txt -Encoding ascii -Width 5000 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- Registry mpio Parameters for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\mpio\Parameters ; Get-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\disk}} `
| Out-File C:\ClusterInfo\MPIO_Best_Practices.txt -Encoding ascii -Width 900 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- Registry iSCSI Parameters for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-ChildItem -Path "HKLM:\System\CurrentControlSet\Control\Class\{4D36E97B-E325-11CE-BFC1-08002BE10318}" -Recurse}} `
| Out-File C:\ClusterInfo\iSCSI_Best_Practices.txt -Encoding ascii -Width 1900 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- Registry iSCSI TCP High Performance Extensions for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-ChildItem -Path HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\Tcp1323Opts}} `
| Out-File C:\ClusterInfo\iSCSI_Best_Practices.txt -Encoding ascii -Width 900 -Append

Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"- Nagle's Algorithm for NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Invoke-Command -ComputerName $_ {Get-ChildItem -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Recurse}} `
| Out-File C:\ClusterInfo\iSCSI_Best_Practices.txt -Encoding ascii -Width 900 -Append


Write-Progress -activity "Obtaining Cluster Information..." -status "Getting NUMA Configuration..." -percentcomplete 98
Get-Content -Path C:\ClusterInfo\ClusterNodes.CSV | ForEach-Object {`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
"-                      NUMA INFORMATION FOR CLUSTER NODE:  $_ ";`
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_`r`n";`
Get-VMHostNumaNode -ComputerName $_ | ft -AutoSize ComputerName, NodeId, MemoryAvailable, MemoryTotal, @{name="ProcessorsAvailabilityLength"; expression= {$_.ProcessorsAvailability.length}}} | Out-File C:\ClusterInfo\VMHostNUMANode.txt -Encoding ascii -Width 5000


Write-Progress -activity "Obtaining Cluster Information..." -status "Wrapping up..." -percentcomplete 99
Start-Sleep -s 5


$EndTime = Get-Date
Add-Content C:\ClusterInfo\ScriptTime.txt "Finished:  $EndTime"
