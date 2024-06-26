<#
.SYNOPSIS
Enables Windows Defender Credential Guard.

.DESCRIPTION
This script enables Windows Defender Credential Guard by setting the registry values for EnableVirtualizationBasedSecurity and LsaCfgFlags.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
.\0344_Enable_Windows_Defender_Credential_Guard.ps1

.NOTES
Ref: https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage
#>
## Enable Windows Defender Credential Guard
### ref 0227_Enable_vitualization_based_Security.bat
### https://learn.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage


$policyPath = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard"
$policyValueName = "EnableVirtualizationBasedSecurity"
$policyValue = 1

$currentValue = Get-ItemProperty -Path $policyPath -Name $policyValueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$policyValueName -ne $policyValue) {
    Set-ItemProperty -Path $policyPath -Name $policyValueName -Value $policyValue
    # Restart the system to apply the changes
    # Restart-Computer   #activate if you want it
    Write-Host "[0344.01_Enable_Windows_Defender_Credential_Guard_Deviceguard] The value of $policyValueName was configured to $policyValue."
}
else {
    Write-Host "[0344.01_Enable_Windows_Defender_Credential_Guard_Deviceguard] The value of $policyValueName is already set to $policyValue."
}


#   # 18.8.5.5 (NG) Ensure 'Turn On Virtualization Based Security: Credential Guard Configuration' is set to 'Enabled with UEFI lock'
#   Registry 'LsaCfgFlags' {
#     Ensure     = 'Present'
#     Key        = 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard'
#     ValueName  = 'LsaCfgFlags'
#     ValueType  = 'DWord'
#     ValueData  = '1'
# }
#$exist = Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard"
#$traitement = Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" |Select-Object LsaCfgFlags
#$traitement = $traitement.LsaCfgFlags






