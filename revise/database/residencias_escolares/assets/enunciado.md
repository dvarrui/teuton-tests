
```
Autora original : Betty Pérez
Fecha           : 20190925
Asunto          : Actividad con mysql teuton
```

---
# Residencias Escolares

* Creación de las tablas en la base de datos.
* Se require software de base de datos MySQL.

# 1. Crear las tablas 

* Hacer un script en que cree la base de datos `bd_residencias_escolares`.
* Añadirle todas las constrains necesarias para que cumpla todos los requisitos pedidos.
* Crear una base de datos en sobre universidades, residencias, estancias,
estudiantes con las siguientes tablas y campos:

## 1.1 Crear tabla `universidades`

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codUniversidad | 6 caracteres        | clave primaria |
| nomUniversidad | Hasta 30 caracteres | valor por defecto "La Laguna" |

## 1.2 Crear tabla `residencias`

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codResidencia  | autonumérico        | clave primaria |
| nomResidencia  | Hasta 30 caracteres |                |
| codUniversidad | 6 caracteres        | clave foránea de la tabla universidades |
| precioMensual  | numérico entero     | valor por defecto 900 |
| comedor        | tipo boolean        | valor por defecto 0 |

## 1.3 Crear tabla `estudiantes`

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codEstudiante  | numérico entero     | clave primaria |
| nomEstudiante  | Hasta 50 caracteres |                |
| dni            | 9 caracteres        | valor único    |
| telefonoEstudiante | 9 caracteres    | valor único    |

## 1.4 Crear tabla `estancias`

| Campo          | Tipo            | Contenido      |
| -------------- | --------------- | -------------- |
| codEstudiante  | numérico entero | clave primaria y clave foránea de estudiantes |
| codResidencia  | numérico entero | clave primaria y foránea de Residencias |
| fechaInicio    | tipo fecha      | clave primaria |
| fechaFin       | tipo fecha      |                |
| preciopagado   | numérico entero |                |

---
# 2. Enunciado

Añadir al script correspondiente en MySql los procedimientos almacenados y funciones indicadas:

## 2.1 Crear procedimientos

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

## 2.2 Crear funciones

* Crear una función (`func01`) que dándole un dni de un alumno nos devuelva en número de meses el tiempo que ha estado en residencias escolares en total ( contando todos las residencias en las que ha estado )

---

# 3. Triggers

Añadir al script correspondiente en MySql los Trigger indicadas:
* Hacer un Trigger en la tabla residencias que si  al insertar o modificar ponemos la fecha inicio posterior a la de fin que las intercambie.
* Hacer un Trigger que en la tabla ResidenciasEscolares al insertar o modificar el precioMensual, no permitirá que sea menor que 900.
* Hacer un Trigger que no permita eliminar ninguna Universidad.
