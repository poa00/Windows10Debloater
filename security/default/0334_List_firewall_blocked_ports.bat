$f=New-object -comObject HNetCfg.FwPolicy2;$f.rules |  where {$_.action -eq "0"} | select name,applicationname,localports