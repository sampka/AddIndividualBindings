 
 
 $AppCmd = "C:\Windows\system32\inetsrv\appcmd.exe" 
 $Sitename = "TSIMidware"

$bothnumbers =  [regex]::matches($($env:computername), "[/\d+/]")


$Datacenter = $bothnumbers[0].value



$Servernumber = [int]$bothnumbers[1].value + 4


    if ($Datacenter -eq 1)
    {
     $Iurl = $Enviroment + "1w" + $Servernumber
    }
    elseif($Datacenter -eq 2)
    {
     $Iurl = $Enviroment + "2w" + $Servernumber
    }
    else
    {
    $Iurl = $null
    }

Write-host $Iurl



 
        & $AppCmd set site /site.name:$Sitename /+"bindings.[protocol='http',bindingInformation='*:80:TheSourceprod$Iurl']"
    