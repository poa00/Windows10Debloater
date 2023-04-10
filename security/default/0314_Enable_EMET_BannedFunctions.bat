:: Enable Enhanced Mitigation Experience Toolkit (EMET) BannedFunctions
:: https://www.stigviewer.com/stig/windows_10/2016-11-03/finding/V-63417
:: https://admx.help/?Category=EMET&Policy=Microsoft.Policies.EMET::AdvancedConfiguration
:: https://www.tenable.com/audits/items/CIS_MS_Windows_7_v3.2.0_Level_1.audit:36aff4b0f24b05b516ed5fe5d4200c8e
:: These advanced mitigations for ROP mitigations apply to all configured software in EMET:
:: Banned Functions will block calls to ntdll!LdrHotPatchRoutine to mitigate potential exploits abusing the API.


reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\EMET\SysSettings"
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\EMET\SysSettings" /v BannedFunctions  /t REG_DWORD /d 1 /f
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\EMET\SysSettings"





