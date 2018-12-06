######## Start kommadoer ###########

Set-PSReadlineOption -BellStyle None 					# deaktiver piping ved backspace
cd C:\Users\alexander\Desktop        					# åpne shell i denne mappen
Set-PSReadlineKeyHandler -Key Tab -Function Complete   	# bash style tab complete

######## Aliaser ##################

Set-Alias -Name l -Value get-childitem   #  ls
Set-Alias -Name cc -Value cls            #  clear screen
Set-Alias -Name xx -Value ex             #	exit Shell

######## Funksjoner ###############

	# exit Shell
function ex (){exit}
	# åpne denne fila med komandoen "profil"
function profil  { start notepad++ C:\Users\alexander\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1}
	# til working dir
function c {Set-Location C:\Users\alexander\Desktop} 
	# move back one dir and display content of .
function bb {Set-Location ..; ls} 
	# move to $path dir and display content of $path dir
function ff ($path) {Set-Location $path; ls }
	# open file with notepad++
function n ($arg){ start notepad++ $arg}  
	# open powershell with elevated rights
function admin () { Start-Process powershell -Verb runAs }

  
   # endre shell prompt
function prompt {
    $currentDirectory = $(Get-Location)

    # Convert-Path needed for pure UNC-locations
    write-host "$(Convert-Path $currentDirectory)" -NoNewline -ForegroundColor White
    write-host " >> " -NoNewline -ForegroundColor Red
    return " "
}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
