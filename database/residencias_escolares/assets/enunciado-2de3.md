

```
Autora original : Betty Pérez
Fecha           : 20190925
Asunto          : Actividad con mysql teuton
```

---

# Residencias Escolares (2 de 3)

Creación de las tablas en la base de datos.

Preparativos
* Instalar el softare de base de datos MySQL.

# Enunciado 2

Añadir al script correspondiente en MySql los procedimientos almacenados y funciones indicadas:

## Crear procedimientos

* Crear un procedimiento almacenado (`proc01`) que liste todos las estancias de cierto alumno pasando por parámetro de entrada el dni del alumno ordenado por fecha de inicio.
* Los datos a visualizar serán:
    * Nombre de residencia
    * nombre de universidad
    * fecha de inicio
    * fecha de fin
    * precio de la estancia
* Crear un procedimiento almacenado (`proc02`) que inserte una residenciaEscolar, de modo que se le pase como parámetros todos los datos.
    * Comprobar que el codigo de universidad pasado exista en la tabla universidades. En caso de que no exista la universidad que no inserte .
    * Devolver en un parámetro de salida: 0 si la universidad no existe y 1 si la universidad existe.
    * Devolver en otro parámetro de salida 0 si la residencia no se insertó y 1 si la inserción fue correcta.
* Crear un procedimiento almacenado (`proc03`) que indicándole una universidad (nombre) y precioMensual , devuelva en un parámetro de salida la cantidad de residencias que hay en esa universidad y en otro
parámetro de salida la cantidad de residencias de esa universidad pero con un precioMensual inferior al indicado.

# Crear funciones

* Crear una función (`func01`) que dándole un dni de un alumno nos devuelva en número de meses el tiempo que ha estado en residencias escolares en total ( contando todos las residencias en las que ha estado )
