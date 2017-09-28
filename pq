#!/bin/bash
#Shell script para consulta de anotações geradas pelo shell script rg

DIR=~/.registro/tags
DIRFONTES=~/.registro
if [ ! -e "$DIR" ]
			then mkdir $DIR
fi

case "$1" in
		lista)
			#echo "Seguem todas as Tags cadastradas, para juntar todas as informações de uma tag usar a opção 'junta'"
			cat ~/.registro/[0-9]* | awk -F " " '{print $3}' | sort -u | uniq
			;;
		junta)
		 	tag=$2
			rm $DIR/$tag.re 2> /dev/null
			grep -h $tag ~/.registro/[0-9]* | while read x;do echo $x >> $DIR/$tag.re;done
			;;
		show)
		    tag=$2	
			cat -n ~/.registro/[0-9]* | grep -h $tag
			;;
		tag)
			tag=$2
			cat -n ~/.registro/[0-9]* | grep -h "[ $tag ]"
			;;
		*)
			echo "use as opções 'lista' ou 'junta $tag' ou 'show $tag' ou 'tag $tag'"	
			;;esac	

