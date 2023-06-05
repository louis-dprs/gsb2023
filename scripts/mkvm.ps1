# POUR POUVOIR EXECUTER DES SCRIPTS POWERSHELL SOUS WINDOWS LANCER COMMANDE SUIVANTE EN ADMIN SOUS POWERSHELL
# set-executionpolicy unrestricted

#mkvm pour toutes les vms

$mkvmrelease="v1.2.2"
$ovarelease="2023b"
$ovafogrelease="2023b"
$ovafile="$HOME\Downloads\debian-bullseye-gsb-${ovarelease}.ova"
$ovafilefog="$HOME\Downloads\debian-buster-gsb-${ovafogrelease}.ova"
$vboxmanage="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
$deletemode=0

#FONCTIONS

function create_vm{ param([string]$nomvm)
	#Importation depuis l'ova
	& "$vboxmanage" import "$ovafile"  --vsys 0 --vmname "$nomvm"
	Write-Host "Machine $nomvm importée"
}

function create_if{ param([string]$nomvm, [string]$nic, [int]$rang, [string]$reseau)
	#Création d'une interface
	if ($nomvm -and $nic -and $rang -and $reseau) {
		if ($nic -eq "bridge") {
			#Création d'une interface en pont
			& "$vboxmanage" modifyvm  "$nomvm" --nic"$rang" bridged
			& "$vboxmanage" modifyvm  "$nomvm" --nictype"$rang" virtio
			& "$vboxmanage" modifyvm  "$nomvm" --cableconnected"$rang" on
			& "$vboxmanage" modifyvm  "$nomvm" --nicpromisc"$rang" allow-all
			Write-Host "$nomvm : IF$rang $nic"
		}
		elseif ($nic -eq "int") {
			#Création d'une interface en reseau interne
			& "$vboxmanage" modifyvm  "$nomvm" --nic"$rang" intnet
			& "$vboxmanage" modifyvm  "$nomvm" --intnet"$rang" "$reseau"
			& "$vboxmanage" modifyvm  "$nomvm" --nictype"$rang" virtio
			& "$vboxmanage" modifyvm  "$nomvm" --cableconnected"$rang" on
			& "$vboxmanage" modifyvm  "$nomvm" --nicpromisc"$rang" allow-all
			Write-Host "$nomvm : IF$rang $nic $reseau"
		}
	}
}

function usage{
	Write-Host "usage : mkvm ${myInvocation.ScriptName} <s-adm|s-infra|r-int|r-ext|s-proxy|s-mon|s-agence|s-appli|s-backup|s-itil|s-ncx|s-fog|s-dns-ext|s-web-ext|s-lb|s-lb-bd|s-lb-web1|s-lb-web2|s-lb-web3|s-web>"
}

if ($args[0] -eq "s-adm") {

	create_vm $args[0]
	create_if $args[0] "bridge" 1 "null"
	create_if $args[0] "int" 2 "n-adm"
	
}

elseif ($args[0] -eq "r-int") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-link"
	create_if $args[0] "int" 3 "n-wifi"
	create_if $args[0] "int" 4 "n-user"
	create_if $args[0] "int" 5 "n-infra"
}

elseif ($args[0] -eq "r-ext") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-dmz"
	create_if $args[0] "bridge" 3 "null"
	create_if $args[0] "int" 4 "n-linkv"
	create_if $args[0] "int" 5 "n-link"
}

elseif (((((((($args[0] -eq "s-elk") `
-or ($args[0] -eq "s-mon") `
-or ($args[0] -eq "s-backup") `
-or ($args[0] -eq "s-appli") `
-or ($args[0] -eq "s-infra") `
-or ($args[0] -eq "s-proxy") `
-or ($args[0] -eq "s-web") `
-or ($args[0] -eq "s-itil") `
-or ($args[0] -eq "s-nxc") `
))))))) {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-infra"
	if ($args[0] -eq "s-elk") {

		& "$vboxmanage" modifyvm "$args[0]" --memory 4096
		Write-Host "$args[0] : 4096 RAM OK"
	}
}

elseif ($args[0] -eq "s-fog") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-infra"
	create_if $args[0] "int" 3 "n-user"
}

elseif ($args[0] -eq "s-agence") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-agence"
}

elseif ($args[0] -eq "s-lb") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-dmz"
	create_if $args[0] "int" 3 "n-dmz-lb"
}

elseif (($args[0] -eq "s-lb-db") -or ($args[0] -eq "s-nas")) {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-dmz-db"
}

elseif ((($args[0] -eq "s-lb-web1") -or ($args[0] -eq "s-lb-web2") -or ($args[0] -eq "s-lb-web3"))) {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-dmz-lb"
	create_if $args[0] "int" 3 "n-dmz-db"
}

elseif (($args[0] -eq "s-dns-ext") -or ($args[0] -eq "s-web-ext")) {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-infra"
	create_if $args[0] "int" 3 "n-user"
}

elseif ($args[0] -eq "r-vp1") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-linkv"
	create_if $args[0] "bridge" 3 "null"
}

elseif ($args[0] -eq "r-vp2") {

	create_vm $args[0]
	create_if $args[0] "int" 1 "n-adm"
	create_if $args[0] "int" 2 "n-agence"
	create_if $args[0] "bridge" 3 "null"
}

else {
	usage
}
