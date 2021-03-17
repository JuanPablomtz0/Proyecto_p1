#!/bin/bash

# paso 1
menu(){
  echo "Usted esta en la sección $1, seleccione la opción que desea utilizar."
  echo "1)Agregar información"
  echo "2)Buscar"
  echo "3)Eliminar información"
  echo "4)Leer base de información"
  echo "introduce opcion: "
  read opcion
  case $opcion in
    1 )
    echo "1"
      ;;
    2 )
    echo "2"
      ;;
    3 )
    echo "3"
      ;;
    4 )
    echo "4"
      ;;
    * )
    echo "no es opcion"
      ;;
  esac
}



if [[ $1 == "-a" ]]; then
  echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
  echo "1.SCRUM"
  echo "2.X.P."
  echo "3.Kanban"
  echo "4.Crystal"
  echo "introduce opcion:"
  read opcion
  case $opcion in
    1 )
    echo "SCRUM"
      menu "srum"
      ;;
    2 )
    echo "X.P."
      menu "xp"
      ;;
    3 )
    echo "Kababan"
      menu "kabana"
      ;;
    4 )
    echo "Crystal"
      menu "crystal"
      ;;
    esac

elif [[ $1 == "-t" ]]; then
  echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
  echo "1.Cascada"
  echo "2.Espiral"
  echo "3.Modelo V"
else
  echo "a bueno bai"
fi


# paso 3

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

# paso 4

# si elige la opcion de agregar informacion

concepto=""
definicion=""

read -p "Concepto a agregar: " concepto
echo "Definicion: "
read definicion

echo $concepto
echo $definicion
