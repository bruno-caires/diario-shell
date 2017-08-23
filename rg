#!/bin/bash
#programa em Bash para registro dos comando e diário de atividades diárias - Bruno 15-08-17

data=`date +%d-%m-%Y-%A`
hora=`date +%H:%M`
DIR=~/.registro
if [ ! -e "$DIR" ]
	then mkdir $DIR
fi

ARQ=$DIR/$data.re
if [ ! -e "$ARQ" ]
	then touch $ARQ
	echo -e "\n\n" >> $ARQ
	echo $data >> $ARQ 
	echo "**********************" >> $ARQ
fi
var=$1
num=$2
case "$var" in
		h)
			while read linha;do echo "$hora [ bash_hist ] - $linha" >> $ARQ;done
		;;
		"")
			echo -e """Não pode ser vazio\n
\ruse 'history | tail -n 4 | rg h' para registrar os últimos 4 linhas dos bash_history com tag bash_hist\n
\ruse 'rg c \$tag' Para registrar multiplas linhas com uma tag, para sair ctrl+c\n
\rou use 'rg \$tag' Para registrar uma única linha com tag	\n
					"""
		;;
		c)
			tag=$2
			while read linha;do echo "$hora [ $tag ] - $linha" >> $ARQ;done
		;;
		*)
    		tag=$1
		 	read -e text
		 	echo "$hora [ $tag ] - $text " >> $ARQ 
		 ;;
 esac

		 
