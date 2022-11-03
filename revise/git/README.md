
`UNDER DEVELOPMENT`

# Git Teuton test ideas

IDalumno="nombre-alumnoXX"
REPO1=https://...git

**test-git-01**: clone, add, commit, push
* Clonar repositorio REPO1
* Crear fichero "IDalumno/README.md"
* Escribir en el fichero: 
```
# test-git-01
(Fecha actual)
```
* Hacer add 
* Hacer commit con mensaje: "test-git-01 IDalumno"
* Hacer push

**test-git-02**: pull, branch, push
* Hacer pull
* Crear una rama IDalumno
* Moverse a la rama IDalumno
* Modificar el ficheo IDalumno/README.md
* Hacer add
* Hacer commit con mensaje: "test-git-02 IDalumno"
* Hacer push

Comandos:
* `git log --pretty=format:"%h-%n, %ar: $s"`
