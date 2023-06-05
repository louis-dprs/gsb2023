cd C:\Program Files\Oracle\VirtualBox

VBoxManage modifyvm r-int --nic1 intnet
VBoxManage modifyvm r-int --intnet1 "n-adm"
VBoxManage modifyvm r-int --nictype1 82540EM
VBoxManage modifyvm r-int --cableconnected1 on
VBoxManage modifyvm r-int --nicpromisc1 allow-all

VBoxManage modifyvm r-int --nic2 intnet
VBoxManage modifyvm r-int --intnet2 "n-link"
VBoxManage modifyvm r-int --nictype2 82540EM
VBoxManage modifyvm r-int --cableconnected2 on
VBoxManage modifyvm r-int --nicpromisc2 allow-all

VBoxManage modifyvm r-int --nic3 intnet
VBoxManage modifyvm r-int --intnet3 "n-wifi"
VBoxManage modifyvm r-int --nictype3 82540EM
VBoxManage modifyvm r-int --cableconnected3 on
VBoxManage modifyvm r-int --nicpromisc3 allow-all

VBoxManage modifyvm r-int --nic4 intnet
VBoxManage modifyvm r-int --intnet4 "n-user"
VBoxManage modifyvm r-int --nictype4 82540EM
VBoxManage modifyvm r-int --cableconnected4 on
VBoxManage modifyvm r-int --nicpromisc4 allow-all

VBoxManage modifyvm r-int --nic5 intnet
VBoxManage modifyvm r-int --intnet5 "n-infra"
VBoxManage modifyvm r-int --nictype5 82540EM
VBoxManage modifyvm r-int --cableconnected5 on
VBoxManage modifyvm r-int --nicpromisc5 allow-all

	
