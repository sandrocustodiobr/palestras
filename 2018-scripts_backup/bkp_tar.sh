#!/bin/bash

compacta()
{
# copia conteudo para o arquivo .tar
x="tar -cvf ${dir}_${data_hora}.tar ${dir}/"
echo "Executando: $x"
$x

# compactando (transforma o .tar em .tar.gz, agora compactado
x="gzip ${dir}_${data_hora}.tar"
echo "Executando: $x"
$x

}

dir="./teste" # sem a barra no final
destino="./" # diretorio corrente, funciona para backup manual, preferivel usar o caminho absoluto nos casos de backup automatizado
data_hora=`date +%Y%m%d_%H%M`

# backup dos dados
compacta

