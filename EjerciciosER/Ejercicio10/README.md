# Star-Trek

Un club de fans de la famosa película Star Trek, ha decidido crear una página web donde se pueda consultar información referente a todas las películas y capítulos de la saga. El dominio startrekfans.com se redirigirá a un servidor web que consulte una base de datos con la siguiente información:

- Actores: es necesario conocer el nombre del actor, el personaje que interpreta, la fecha de nacimiento y su nacionalidad.
- Personajes: es necesario saber el nombre, graduación militar que desempeña (capitán, teniente, almirante, etc) y su raza (humano,vulcano, klingon). Si el personaje es humano, se indicará su fecha de nacimiento y ciudad terráquea donde nació, si el personaje es de la raza Vulcano, se almacenará el nombre del mento y la fecha de graduación, y si es de raza Klingon, se guardará su planeta natal y la fecha de su último combate. Es importante conocer el actor que interpreta el personaje, teniendo en cuenta que, un personaje sólo puede ser interpretado por un actor, y un actor sólo puede interpretar un personaje. Además, será necesarios conocer el personaje del que depende directamente en graduación militar.
- Capítulos: hay que almacenas todos los capítulos, indicando a que temporada pertenece cada capítulo, el título, el orden en el que fue rodado, fecha de su primera emisión en televisión y los personajes que participaron en cada capítulo.
- Películas: se debe almacenar también, todas las películas que se proyectaron en cines, cada una con su año de lanzamiento, título y director. También hay que guardar los personajes que aparecen en cada película y cuál de ellos fue el protagonista.
- Planetas: en cada capítulo, se visita uno o varios planetas, hay que almacenar el código del planeta, su nombre, galaxia a la que pertenece, el problema que se resolvió en esa visita y la nave con la que se viajó al planeta. Para la descripción de la nave se almacenará el nombre, código y número de tripulantes. La nave que viaja a un planeta puede disponer de una nave pequeña llamada lanzadera con la que bajan a la superficie del planeta. La existencia de la lanzadera solo tiene sentido si existe la nave a la que pertenece. Se identificará cada lanzadera mediante un número entero y el código de la nave. Es necesario conocer la capacidad en personas de la lanzadera.

## Paso 1
Proponer las frases que describan el problema y generar las entidades y relaciones.

- Cada personaje es interptetado exclusivamente por un actor.
- Los personajes pueden aparecer en capítulos de la serie y las películas.
- Un personaje puede ser humano, vulcano o klingon.
- Cada capítulo transcurre en un planeta.
- La nave es el medio hacia los planetas.
- La nave puede o no tener una lanzadera.

![<>](img/Captura%20de%20pantalla%202022-10-31%20163232.png)

## Paso 2
Montar correctamente todas las entidades y sus relaciones y colocar los atributos a cada entidad e interrelación.

![<>](img/Captura%20de%20pantalla%202022-10-31%20163308.png)