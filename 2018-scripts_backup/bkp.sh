#!/bin/bash

copia()
{
# copia ${origem} para dentro de ${destino} (./${destino}/${origem}/)
x="rsync --recursive --update --delete --verbose ${origem} ${destino}"
echo "Executando: $x"
$x

}

origem="/dados/"
destino="/media/custodio/MeuBackup/"
mkdir 2>/dev/null logs
log="logs/bkp.`date +%Y-%m-%d`.log"
touch $log

# copia a si mesmo (se inclui na copia que o rsync vai fazer)
x="cp -v $0 ${origem}"
echo "Executando: $x"
$x

# backup dos dados
copia | tee -a ${log}

echo "Pressione Enter."
read x
