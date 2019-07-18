######## Start kommadoer ###########

Set-PSReadlineOption -BellStyle None 					# deaktiver piping ved backspace
Set-PSReadlineKeyHandler -Key Tab -Function Complete   	# bash style tab complete
Import-Module posh-git									# improved Git integrarion with powershell

	# ?pne shell i denne mappen
if ( (Get-Location).Path -eq  "C:\ProgramData\Cmder" ) {
        Set-Location  "C:\Users\$env:USERNAME\Desktop"
}

######## Aliaser ################## 

Set-Alias -Name l -Value get-childitem   #  ls
Set-Alias -Name cc -Value cls            #  clear screen
Set-Alias -Name xx -Value ex             #	exit Shell
Set-Alias -Name vi -Value vim             #	start vim


######## Funksjoner ###############

	# exit Shell
function ex (){exit}
	# ?pne denne fila med komandoen "profil"
function profil  { 
	notepad++.exe C:\Users\alexander\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
		# source the profile file
	. C:\Users\alexander\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
	}
	# til working dir
function c {Set-Location C:\Users\alexander\Desktop} 
	# move back one dir and display content of .
function bb {Set-Location ..; ls} 
	# move to $path dir and display content of $path dir
function ff ($path) {Set-Location $path; ls }
	# open file with notepad++
function n ($arg){  notepad++.exe $arg }  
	# open powershell with elevated rights
function admin () { Start-Process powershell -Verb runAs }
	# ssh to remote server
function alexajak () { ssh alexajak@login.stud.ntnu.no}

function bssh ($arg){ ssh -o StrictHostKeyChecking=no  -o UserKnownHostsFile=/dev/null -i "C:\\Users\alexander\.ssh\Bachelor.pem" "ubuntu@$arg"}
	# start Ubuntu 18.04 in VM
function ubuntu () { 
	start 'C:\Users\alexander\Documents\Virtual Machines\Ubuntu 18.04\Ubuntu 18.04.vmx' "C:\Program Files (x86)\VMware\VMware Player\vmplayer.exe"
	}
function vimrc () {notepad++.exe "C:\Program Files (x86)\vim\_vimrc"}	
	
	# open vim in bash
#function vim ($arg) { $arg -replace "\\" , "/"; bash -c  "vim " $arg }
  
   # endre shell prompt
#function prompt {
 #   $currentDirectory = $(Get-Location)

    # Convert-Path needed for pure UNC-locations
  #  write-host "PS  $(Convert-Path $currentDirectory)" -NoNewline -ForegroundColor White
   # write-host " >> " -NoNewline -ForegroundColor Red
    #return " "
#}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

