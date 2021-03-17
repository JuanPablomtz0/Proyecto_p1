#!/bin/bash


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
