#!/bin/bash

ls . | while read arq
do
	# outros operadores úteis em https://aurelio.net/shell/canivete/#operadores no topico "Testes em arquivos"
	if [ -d ${arq} ] 
	then
		tipo="diretorio"
	else
		tipo="arquivo"
	fi

	echo "Arquivo: ${arq} (${tipo})"
done


