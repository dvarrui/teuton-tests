
```
Autora original : Betty Pérez
Fecha           : 20190925
Asunto          : Actividad con mysql teuton
```

---
# Residencias Escolares (1 de 3)

* Creación de las tablas en la base de datos.
* Se require software de base de datos MySQL.

# Enunciado 1 de 3

* Hacer un script en que cree la base de datos `bd_residencias_escolares`.
* Añadirle todas las constrains necesarias para que cumpla todos los requisitos pedidos.
* Crear una base de datos en sobre universidades, residencias, estancias,
estudiantes con las siguientes tablas y campos:

* Crear tabla `universidades` con los siguientes campos:

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codUniversidad | 6 caracteres        | clave primaria |
| nomUniversidad | Hasta 30 caracteres | valor por defecto "La Laguna" |

* Crear tabla `residencias` con los siguientes campos:

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codResidencia  | autonumérico        | clave primaria |
| nomResidencia  | Hasta 30 caracteres |                |
| codUniversidad | 6 caracteres        | clave foránea de la tabla universidades |
| precioMensual  | numérico entero     | valor por defecto 900 |
| comedor        | tipo boolean        | valor por defecto 0 |

* Crear tabla `estudiantes` con los siguientes campos:

| Campo          | Tipo                | Contenido      |
| -------------- | ------------------- | -------------- |
| codEstudiante  | numérico entero     | clave primaria |
| nomEstudiante  | Hasta 50 caracteres |                |
| dni            | 9 caracteres        | valor único    |
| telefonoEstudiante | 9 caracteres    | valor único    |

* Crear tabla `estancias` con los siguientes campos:

| Campo          | Tipo            | Contenido      |
| -------------- | --------------- | -------------- |
| codEstudiante  | numérico entero | clave primaria y clave foránea de estudiantes |
| codResidencia  | numérico entero | clave primaria y foránea de Residencias |
| fechaInicio    | tipo fecha      | clave primaria |
| fechaFin       | tipo fecha      |                |
| preciopagado   | numérico entero |                |
