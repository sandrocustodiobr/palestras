#!/bin/bash

copia()
{
# copia ${origem} para dentro de ${destino} (./${destino}/${origem}/)
x="rsync --recursive --update --delete --verbose ${origem} ${base_dir_destino}${origem}"
echo "Executando: $x"
$x
}

mkdir 2>/dev/null logs
log="logs/bkp.`date +%Y-%m-%d`.log"
touch $log

base_dir_origem="/dados/palestras/"
base_dir_destino="/dados/palestras/teste/"
destino="${base_dir_destino}"

if [ ! -e ${destino} ]; then
	echo "Criando pasta ${destino}"
	mkdir -p ${destino}
fi

# copia a si mesmo (se inclui na copia que o rsync vai fazer)
x="cp -p $0 ${destino}"
echo "Executando: $x"
$x

# backup dos dados
origem1="github_palestras/"
origem2="teste_rsync/"

# aqui permite enumerar varios diretorios para o backup
for origem in ${origem1} ${origem2} 
do
	#origem=${base_dir_origem}${origem}
	echo "Backup de: ${base_dir_origem}${origem}"
	copia
done

#echo "Pressione Enter."
#read x
