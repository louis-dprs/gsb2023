#!/usr/pbin/perl
use strict;
use warnings;
use v5.10;

my $ovarelease = "2023a";
my $ovafogrelease = "2023a";
my $home=$ENV{'HOME'}; 
my $ovafile="$home/Téléchargements/debian-bullseye-gsb-".$ovarelease.".ova";
my $ovafilefog="$home/Téléchargements/debian-buster-gsb-i".$ovafogrelease.".ova";

my %vmtab = (
	#name => "s-adm", params => ":1024:"
	name => "s-adm", params => ":1024:n-adm:n-infra",
	name => "s-infra", params => ":1024:n-adm:n-infra",
	name => "s-proxy", params => ":1024:n-adm:n-infra",
	name => "r-int", params => ":1024:n-adm:n-link:n-wifi:n-user:n-infra",
	name => "r-ext", params => ":1024:n-adm:n-dmz:eno1:n-linkvi:n-link",
	name => "s-mon", params => ":1024:n-adm:n-infra",
	name => "s-itil", params => ":1024:n-adm:n-infra",
	name => "s-appli", params => ":1024:n-adm:n-infra",
	name => "s-backup", params => ":1024:n-adm:n-infra",
	name => "s-fog", params => ":1024:n-adm:n-infra:n-user",
	name => "s-nxc", params => ":1024:n-adm:n-infra",

)

sub usage () {
	say "$0 - version ${ovarelease}";
	say "$0 : creation VM et parametrage interfaces";
	say "usage : $0 <s-infra|r-int|r-ext|s-proxy|s-mon>";
	exit 1 ;
}

sub create_vm () {
	my $nom = shift  ; 
	my $nomova = shift ;
	if ( $nom == "s-fog" ) { 
		$nomova = $ovafilefog;
	}
	if (  ! -r $nomova ) {
		say "$0 : erreur ouverture fichier $nomova ..."
		exit 3
	}
	qx (vboxmanage import $nomova  --vsys 0 --vmname $nom);
}

sub setif () {
	my ($vm, $interf, $parm) = @ARGV;
	qx(VBoxManage modifyvm $vm --nic"${2}" intnet);
	qx(VBoxManage modifyvm $vm --intnet"${2}" "$3");
	qx(VBoxManage modifyvm $vm --nictype"${2}" 82540EM);
	qx(VBoxManage modifyvm $vm --cableconnected"${2}" on);
	qx(VBoxManage modifyvm $vm --nicpromisc"${2}" allow-all);
}

sub create_if () {
# enp0s3
	setif "$1" 1 "$2"
	setif "$1" 2 "$3"
#(enp0s8)
}


create_vm "${vm}"
if [[ "${vm}" == "s-infra" ]] ; then
	create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-proxy" ]] ; then
	create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "r-int" ]] ; then
#	n-adm, n-link, n-wifi, n-user, n-infra
	create_if "${vm}" "n-adm" "n-infra"
	setif "${vm}" 2 "n-link"
	setif "${vm}" 3 "n-wifi"
	setif "${vm}" 4 "n-user"
	setif "${vm}" 5 "n-infra"
elif [[ "${vm}" == "r-ext" ]] ; then
	./addint.r-ext
elif [[ "${vm}" == "s-mon" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-appli" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-backup" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-itil" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-nxc" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-fog" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
	setif "${vm}" 3 "n-user"
elif [[ "${vm}" == "s-DNS-ext" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz"
elif [[ "${vm}" == "s-web-ext" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz"
elif [[ "${vm}" == "s-nxc" ]] ; then
        create_if "${vm}" "n-adm" "n-infra"
elif [[ "${vm}" == "s-lb" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz" "n-dmz-lb"
elif [[ "${vm}" == "s-web1" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz-lb" "n-dmz-db"
#	setif "${vm}" 3 "n-dmz-lb"
elif [[ "${vm}" == "s-web2" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz-lb" "n-dmz-db"
elif [[ "${vm}" == "s-web3" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz-lb" "n-dmz-db"
 #       setif "${vm}" 3 "n-dmz-lb"
elif [[ "${vm}" == "s-lb-bd" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz-db"
elif [[ "${vm}" == "s-nas" ]] ; then
        create_if "${vm}" "n-adm" "n-dmz-db"
elif [[ "${vm}" == "r-vp1" ]] ; then
	./addint.r-vp1
elif [[ "${vm}" == "r-vp2" ]] ; then
	./addint.r-vp2
elif [[ "${vm}" == "s-agence" ]] ; then
	create_if "${vm}" "n-adm" "n-agence"

else
	echo "$0 : vm ${vm} non prevu"
        exit 2	
fi	


sub usage () {
	 print "usage : mkvm.pl <vm-name>\n";
	 print "cree une VM a partir d'un fichier OVA et parametre les interfaces";
	 exit 1 ;
}

sub main () {
	my $vm = shift;
	usage unless ( $vm);

}
