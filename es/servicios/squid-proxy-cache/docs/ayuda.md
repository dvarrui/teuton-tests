
# AYUDA

> Esto es un resumen para tener las ideas más claras

---

## INSTALACION DE TEUTON

1. Entrar como root
2. Ejecutar el siguiente comando para instalar teuton `gem install teuton`
3. Ejecutar `teuton version` para comprobar que todo está OK.
4. Salir de root y ser usuario normal. Vete a la carpeta que quieras de tu home.
5. Para descargar los retos en tu directorio local ejecutamos  `git clone https://github.com/dvarrui/teuton-tests.git`, pero más corto.

---

## Ejecutar un reto

Ahora si se quiere ejecutar un reto hacemos:
1. Entrar como usuario `root`.
2. Entrar a la carpeta `teuton-tests`
3. `teuton check es/servicios/squid/proxy-cache` para verificar que el reto es correcto.
4. `teuton es/servicios/squid/proxy-cache` para ejecutar ese reto.
5. `more var/proxy-cache/case-01...` para ver el informe con los resultados.

