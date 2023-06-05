cd C:\Program Files\Oracle\VirtualBox

VBoxManage modifyvm r-ext --nic1 intnet
VBoxManage modifyvm r-ext --intnet1 "n-adm"
VBoxManage modifyvm r-ext --nictype1 82540EM
VBoxManage modifyvm r-ext --cableconnected1 on
VBoxManage modifyvm r-ext --nicpromisc1 allow-all

VBoxManage modifyvm r-ext --nic2 intnet
VBoxManage modifyvm r-ext --intnet2 "n-dmz"
VBoxManage modifyvm r-ext --nictype2 82540EM
VBoxManage modifyvm r-ext --cableconnected2 on
VBoxManage modifyvm r-ext --nicpromisc2 allow-all

VBoxManage modifyvm r-ext --nic3 bridged
VBoxManage modifyvm r-ext --bridgeadapter3 "enp0s3"
VBoxManage modifyvm r-ext --nictype3 82540EM
VBoxManage modifyvm r-ext --cableconnected3 on
VBoxManage modifyvm r-ext --nicpromisc3 allow-all

VBoxManage modifyvm r-ext --nic4 intnet
VBoxManage modifyvm r-ext --intnet4 "n-linkv"
VBoxManage modifyvm r-ext --nictype4 82540EM
VBoxManage modifyvm r-ext --cableconnected4 on
VBoxManage modifyvm r-ext --nicpromisc4 allow-all

VBoxManage modifyvm r-ext --nic5 intnet
VBoxManage modifyvm r-ext --intnet5 "n-link"
VBoxManage modifyvm r-ext --nictype5 82540EM
VBoxManage modifyvm r-ext --cableconnected5 on
VBoxManage modifyvm r-ext --nicpromisc5 allow-all
