#!/bin/bash

crear() {
  if [[ ! -e "./info"  ]]; then
    mkdir "./info"
  fi

  cd info

  if [[ ! -f "./scrum.inf"  ]]; then
    echo "creado scrum.inf"
    touch "./scrum.inf"
  fi

  if [[ ! -f "./xp.inf"  ]]; then
    echo "creado xp.inf"
    touch "./xp.inf"
  fi

  if [[ ! -f "./kanban.inf"  ]]; then
    echo "creado kanban.inf"
    touch "./kanban.inf"
  fi

  if [[ ! -f "./crystal.inf"  ]]; then
    echo "creado crystal.inf"
    touch "./crystal.inf"
  fi

  if [[ ! -f "./cascada.inf"  ]]; then
    echo "creado cascada.inf"
    touch "./cascada.inf"
  fi

  if [[ ! -f "./espiral.inf"  ]]; then
    echo "creado espiral.inf"
    touch "./espiral.inf"
  fi

  if [[ ! -f "./modelov.inf"  ]]; then
    echo "creado modelov.inf"
    touch "./modelov.inf"
  fi
}

agregar() {
  file="$1"
  concepto=""
  definicion=""

  read -p "Concepto a agregar: " concepto
  echo "Definicion: "
  read definicion
  echo -e "[$concepto].- $definicion" >> "./$file.inf"

}

buscar(){
  file="$1.inf"
  echo "Intorduce concepto a buscar:"
  read concepto
  concepto="[$concepto]"
  length=${#concepto}
  while read line; do
    lineLength=${#line}
    if [[ $lineLength -gt $length ]]; then
      substr="${line:0:$length}"
      if [[ "$concepto" ==  "$substr" ]]; then
        echo "$line"
      fi
    fi
  done<$file

}

eliminar(){
  file="$1.inf"
  echo "Eliminar"
  echo "Intorduce concepto a eliminar:"
  read concepto
  concepto="[$concepto]"
  length=${#concepto}
  i=1
  while read line; do
    lineLength=${#line}
    if [[ $lineLength -gt $length ]]; then
      substr="${line:0:$length}"
      if [[ "$concepto" ==  "$substr" ]]; then
        dLines="${i}d"
        sed -i $dLines $file
      fi
    fi
    i=$((i+1))
  done<$file
}

leer(){
  file="$1.inf"
  echo -e "La base de datos de $1 tiene:\n"
  while read line; do
    echo "$line"
  done<$file
}

menu(){
  opcions=0
  while [[ $opcions -ne 5 ]]; do
      echo -e "\nUsted esta en la sección $1, seleccione la opción que desea utilizar."
      echo "1)Agregar información"
      echo "2)Buscar"
      echo "3)Eliminar información"
      echo "4)Leer base de información"
      echo "5)Salir"
      echo "Introduce una opcion:"
      read opcions
      case $opcions in
        1 )
        agregar $1
          ;;
        2 )
        buscar $1
    	 ;;
        3 )
        eliminar $1
          ;;
        4 )
        leer $1
          ;;
        5)
        echo "Volver"
          ;;
        * )
        echo "No es opcion"
          ;;
    esac
  done
}

# genera los documentos
crear


if [[ $1 == "-a" ]]; then
  opciona=0
  while [[ $opciona -ne 5 ]]; do

    echo -e "\nBienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
    echo "1.SCRUM"
    echo "2.X.P."
    echo "3.Kanban"
    echo "4.Crystal"
    echo "5.Volver"
    echo "Introduce una opcion:"
    read opciona
    case $opciona in
      1 )
        menu "scrum"
        ;;
      2 )
        menu "xp"
        ;;
      3 )
        menu "kanban"
        ;;
      4 )
        menu "crystal"
        ;;
      5 )
      echo "Goodbye <3"
        ;;
      esac
  done

elif [[ $1 == "-t" ]]; then
  opciont=0
  while [[ $opciont -ne 5 ]]; do
    echo -e "\nBienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1.Cascada"
    echo "2.Espiral"
    echo "3.Modelo V"
    echo "5.Volver"
    echo "Introduce una opcion:"
    read opciont
    case $opciont in
      1 )
        menu "cascada"
        ;;
      2 )
        menu "espiral"
        ;;
      3 )
        menu "modelov"
        ;;
      5 )
      echo "Goodbye <3"
        ;;

    esac
  done
else
  echo "Parametro no valido"
fi
