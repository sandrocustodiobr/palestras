#!/bin/bash

compacta()
{
# copia conteudo para o arquivo .tar
x="tar -cvf ${dir}.tar ${dir}/"
echo "Executando: $x"
$x
}

dir="./teste_tar" # sem a barra no final
destino="./" # diretorio corrente, funciona para backup manual, preferivel usar o caminho absoluto nos casos de backup automatizado

# backup dos dados
compacta

