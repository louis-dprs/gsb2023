#!/bin/bash

BDIR=/home/backup
SWIN=/tmp/s-win
LOCK=/tmp/s-backup.lock

#Fonction cleanup pour sortir propre dans tout les cas
cleanup()
{
  rm "${LOCK}"
  umount "${SWIN}"
  echo "nettoyage effectue, sortie tout propre ..."
  exit 3
}

#check si pas deja en cours d execution > sortie si fichier de lock existe
if [ -e "${LOCK}" ] ; then
	echo "$0 : Verrouillage, deja en cours d execution"
	trap cleanup 1 2 3 6
fi
#prepartion des dossiers qui vont accueillir les donnees à sauvegarder
[ -d "${BDIR}" ] || mkdir "${BDIR}"
[ -d "${BDIR}/s-win" ] || mkdir "${BDIR}/s-win"
[ -d "${SWIN}" ] || mkdir "${SWIN}"

#etablissement du lock
touch "${LOCK}"

mount -t cifs -o ro,vers=3.0,username=uBackup,password=Azerty1+ //s-win/commun "${SWIN}"
if [ $? != 0 ] ; then
	echo "$0 : erreur montage ${SWIN}"
	rm "${LOCK}"
	trap cleanup 1 2 3 6
fi
rsync -av "${SWIN}/" "${BDIR}/s-win/commun"
umount "${SWIN}"


mount -t cifs -o ro,vers=3.0,username=uBackup,password=Azerty1+ //s-win/public "${SWIN}"
if [ $? != 0 ] ; then
	echo "$0 : erreur montage ${SWIN}"
	trap cleanup 1 2 3 6
fi
rsync -av "${SWIN}/" "${BDIR}/s-win/public"
umount "${SWIN}"

#libere le verrou
rm "${LOCK}"

exit 0

