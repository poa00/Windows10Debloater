
REM https://www.peerlyst.com/posts/windows-dde-registry-tweaks-roger-barnett?utm_source=linkedin&utm_medium=Application_Share&utm_content=peerlyst_post&utm_campaign=peerlyst_shared_post

echo  Disable Word 2016 Default DDE links activation
REM Value: DontUpdateLinks
REM Dword: 00000001
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\Options" /v "DontUpdateLinks" /t REG_DWORD /d 1 /f  
