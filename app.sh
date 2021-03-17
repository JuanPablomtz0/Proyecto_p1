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

  echo $concepto
  echo $definicion

  echo -e "[$concepto].- $definicion" >> "./$file.inf"

}

buscar(){
  elementobuscar=""
  file="$1"
  echo "ingrese elemento a buscar"
  read elementobuscar
  grep -i "[$elementobuscar].-" ./$file.inf

}
eliminar(){
  file="$1"
  conceptoeliminar=""
  echo "Ingrese concepto a eliminar: "
  read conceptoeliminar
  sed -i '/$conceptoeliminar/d' ./$file.inf
}



eliminar(){
  file="$1.inf"
  echo "Eliminar"
  echo "intorduce concepto"
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
  echo "Leer"
  while read line; do
    echo "$line"
  done<$file
}

menu(){
  while [[ $opcions -ne 5 ]]; do
      echo "Usted esta en la sección $1, seleccione la opción que desea utilizar."
      echo "1)Agregar información"
      echo "2)Buscar"
      echo "3)Eliminar información"
      echo "4)Leer base de información"
      echo "5) Salir"
      echo "introduce opcion: "
      read opcions
      case $opcions in
        1 )
        echo "1"
        agregar $1
          ;;
        2 )
        echo "2"
        buscar $1
    	 ;;
        3 )
        echo "3"
        eliminar $1
          ;;
        4 )
        echo "4"
          ;;
        5)
        echo "Salir"
          ;;
        * )
        echo "no es opcion"
          ;;
    esac
  done
}

crear

# desmadre v


if [[ $1 == "-a" ]]; then
opciona=0
  while [[ $opciona -ne 5 ]]; do

    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
    echo "1.SCRUM"
    echo "2.X.P."
    echo "3.Kanban"
    echo "4.Crystal"
    echo "5.salir"
    echo "introduce opcion:"
    read opciona
    case $opciona in
      1 )
      echo "SCRUM"
        menu "scrum"
        ;;
      2 )
      echo "X.P."
        menu "xp"
        ;;
      3 )
      echo "Kanban"
        menu "kanban"
        ;;
      4 )
      echo "Crystal"
        menu "crystal"
        ;;
      5 )
      echo "Salir"
        ;;
      esac
  done




elif [[ $1 == "-t" ]]; then
  opciont=0
  while [[ $opciont -ne 4 ]]; do
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1.Cascada"
    echo "2.Espiral"
    echo "3.Modelo V"
    echo "4.salir"
    echo "introduce opcion:"
    read opciont
    case $opciont in
      1 )
      echo "Cascada"
        menu "cascada"
        ;;
      2 )
      echo "Espiral"
        menu "espiral"
        ;;
      3 )
      echo "modelov"
        menu "modelov"
        ;;
      4)
      echo "Salir"
        ;;

    esac
  done
else
  echo "a bueno bai"
fi
