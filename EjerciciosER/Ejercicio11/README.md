# Gestión docente

Diseñar una Base de Datos para representar la información docente de un colegio, sabiendo que: La formación abarca ocho cursos (1º, 2º, 3º .. 8º) en los que se imparten diversas asignaturas, tales como Matemáticas, Física, Ciencias Naturales, Sociales, Dibujo, etc., dándose el caso de algunas asignaturas de distintos cursos que tienen el mismo nombre. Cada curso se reparte en varios grupos de alumnos a los que se asigna una letra: p.e. 3ºA, 2ºD, 5ºC, 1ºB, y se ubican en un aula fija para todo el curso. Las aulas, identificadas por un número, tienen una determinada capacidad de número de alumnos. De ellas interesa conocer, además, si disponen o no de conexión a la red de computadores del centro, y de pantalla para la proyección de transparencias. Los profesores del centro, de los que se dispone de su nombre y apellidos, DNI, dirección y teléfono, pueden impartir varias asignaturas distintas a grupos distintos. Además, cada curso tiene un profesor coordinador y cada grupo un profesor tutor. Acerca de los alumnos, además de su nombre y apellidos, dirección y teléfono, se desea reflejar el curso en que están matriculados y el grupo al que están asignados. También se desea representar qué alumno es el delegado de cada grupo. Como puede darse el caso, de alumnos con el mismo nombre y apellidos, cada alumno tiene asociado un (único) número de matrícula que facilita su identificación.

## Paso 1
Proponer las frases que describan el problema y generar las entidades y relaciones.

- Cada curso contiene unas asignaturas.
- Los alumnos se reparten en grupos.
- Los grupos tienen un aula fija.
- Los profesores pueden repartir varias asignaturas a distintos alumnos.
- Los profesoes pueden ser tutores y coordinadores.
- Un alumno puede ser delegado

![<>](img/Captura%20de%20pantalla%202022-10-31%20163712.png)

## Paso 2
Montar correctamente todas las entidades y sus relaciones y colocar los atributos a cada entidad e interrelación.

![<>](img/Captura%20de%20pantalla%202022-10-31%20163742.png)