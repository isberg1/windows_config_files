Set-ExecutionPolicy RemoteSigned

choco install foxitreader -y
choco install vlc -y
choco install atom -y
choco install notepadplusplus -y 
choco install git -y
choco install golang -y
choco install discord -y 
choco install googlechrome -y 


Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
