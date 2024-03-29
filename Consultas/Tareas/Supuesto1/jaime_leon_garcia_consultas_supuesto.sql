-- Consultas sobre una tabla (0,6 puntos)

-- 1. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;
/*
┌─────────────────────────┬────────┐
│         nombre          │ precio │
├─────────────────────────┼────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │
└─────────────────────────┴────────┘
*/
-- 2. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre, precio from producto where precio >= 80 and precio <= 300;
/*
┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ Disco duro SATA3 1TB            │ 86.99  │
│ Memoria RAM DDR4 8GB            │ 120.0  │
│ Disco SSD 1 TB                  │ 150.99 │
│ GeForce GTX 1050Ti              │ 185.0  │
│ Monitor 24 LED Full HD          │ 202.0  │
│ Monitor 27 LED Full HD          │ 245.99 │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘
*/
-- 3. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

-- 4. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre, precio from producto where precio >= 80 and precio <= 300;
/*
┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ Disco duro SATA3 1TB            │ 86.99  │
│ Memoria RAM DDR4 8GB            │ 120.0  │
│ Disco SSD 1 TB                  │ 150.99 │
│ GeForce GTX 1050Ti              │ 185.0  │
│ Monitor 24 LED Full HD          │ 202.0  │
│ Monitor 27 LED Full HD          │ 245.99 │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘
*/
-- 5. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from pr from producto where nombre like '%Monitor%' and precio < 215;
/*
┌────────────────────────┐
│         nombre         │
├────────────────────────┤
│ Monitor 24 LED Full HD │
└────────────────────────┘
*/
-- 6. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre from producto where precio >=180 order by precio desc, nombre;
/*
┌─────────────────────────────────┐
│             nombre              │
├─────────────────────────────────┤
│ GeForce GTX 1080 Xtreme         │
│ Portátil Yoga 520               │
│ Portátil Ideapd 320             │
│ Monitor 27 LED Full HD          │
│ Monitor 24 LED Full HD          │
│ GeForce GTX 1050Ti              │
│ Impresora HP Laserjet Pro M26nw │
└─────────────────────────────────┘
*/
-- Consultas multitabla (INNER 0,7 puntos) Obligatorio aprobar

-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, precio, f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where precio = (select max(precio) from producto);
/*
┌─────────────────────────┬────────┬─────────┐
│         nombre          │ precio │ nombre  │
├─────────────────────────┼────────┼─────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
└─────────────────────────┴────────┴─────────┘
*/
-- 8. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select p.nombre, precio, f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where precio = (select max(precio) from producto);
/*
┌─────────────────────────┬────────┬─────────┐
│         nombre          │ precio │ nombre  │
├─────────────────────────┼────────┼─────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
└─────────────────────────┴────────┴─────────┘
*/
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select p.* from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre='Seagate';
/*
┌────────┬─────────────────────────────────┬────────┬───────────────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │
├────────┼─────────────────────────────────┼────────┼───────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
│ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
└────────┴─────────────────────────────────┴────────┴───────────────────┘
*/
-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select p.* from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre in ('Asus','Hewlett-Packard','Seagate');
/*
┌────────┬─────────────────────────────────┬────────┬───────────────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │
├────────┼─────────────────────────────────┼────────┼───────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
│ 10     │ Impresora HP Deskjet 3720       │ 59.99  │ 3                 │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
└────────┴─────────────────────────────────┴────────┴───────────────────┘
*/
-- 11. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre like '%e';
/*
┌──────────────────────┬────────┐
│        nombre        │ precio │
├──────────────────────┼────────┤
│ Disco duro SATA3 1TB │ 86.99  │
│ GeForce GTX 1050Ti   │ 185.0  │
└──────────────────────┴────────┘
*/
-- 12. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre like '%w%';
/*
┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ Impresora HP Deskjet 3720       │ 59.99  │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘
*/
-- 13. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio from producto as p join fabricante as f on p.codigo_fabricante=f.codigo where f.nombre like '%w%';
/*
┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ Impresora HP Deskjet 3720       │ 59.99  │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘
*/
-- 14. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select distinct f.codigo, f.nombre from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante where p.codigo_fabricante is not null;┌────────┬─────────────────┐
/*
┌────────┬─────────────────┐
│ codigo │     nombre      │
├────────┼─────────────────┤
│ 5      │ Seagate         │
│ 6      │ Crucial         │
│ 4      │ Samsung         │
│ 7      │ Gigabyte        │
│ 1      │ Asus            │
│ 2      │ Lenovo          │
│ 3      │ Hewlett-Packard │
└────────┴─────────────────┘
*/
-- Consultas multitabla (LEFT/RIGHT JOIN 0,2) Obligatorio aprobar

-- 15. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select f.nombre, p.nombre from fabricante as f left join producto as p on p.codigo_fabricante=f.codigo;
/*
┌─────────────────┬─────────────────────────────────┐
│     nombre      │             nombre              │
├─────────────────┼─────────────────────────────────┤
│ Asus            │ Monitor 24 LED Full HD          │
│ Asus            │ Monitor 27 LED Full HD          │
│ Lenovo          │ Portátil Ideapd 320             │
│ Lenovo          │ Portátil Yoga 520               │
│ Hewlett-Packard │ Impresora HP Deskjet 3720       │
│ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │
│ Samsung         │ Disco SSD 1 TB                  │
│ Seagate         │ Disco duro SATA3 1TB            │
│ Crucial         │ GeForce GTX 1080 Xtreme         │
│ Crucial         │ Memoria RAM DDR4 8GB            │
│ Gigabyte        │ GeForce GTX 1050Ti              │
│ Huawei          │                                 │
│ Xiaomi          │                                 │
└─────────────────┴─────────────────────────────────┘
*/
-- 16. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select f.nombre, p.nombre from fabricante as f left join producto as p on p.codigo_fabricante=f.codigo where p.codigo is null;
/*
┌────────┬────────┐
│ nombre │ nombre │
├────────┼────────┤
│ Huawei │        │
│ Xiaomi │        │
└────────┴────────┘
*/
--  Consultas resumen (0,6)

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select f.nombre, max(precio), min(precio), avg(precio) from producto as p join fabricante as f on p.codigo_fabricante = f.codigo group by f.nombre;
/*
┌─────────────────┬─────────────┬─────────────┬─────────────┐
│     nombre      │ max(precio) │ min(precio) │ avg(precio) │
├─────────────────┼─────────────┼─────────────┼─────────────┤
│ Asus            │ 245.99      │ 202.0       │ 223.995     │
│ Crucial         │ 755.0       │ 120.0       │ 437.5       │
│ Gigabyte        │ 185.0       │ 185.0       │ 185.0       │
│ Hewlett-Packard │ 180.0       │ 59.99       │ 119.995     │
│ Lenovo          │ 559.0       │ 444.0       │ 501.5       │
│ Samsung         │ 150.99      │ 150.99      │ 150.99      │
│ Seagate         │ 86.99       │ 86.99       │ 86.99       │
└─────────────────┴─────────────┴─────────────┴─────────────┘
*/
-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
select f.nombre, max(precio), min(precio), avg(precio) from producto as p join fabricante as f on p.codigo_fabricante = f.codigo group by f.nombre having avg(precio) > 200;
/*
┌─────────┬─────────────┬─────────────┬─────────────┐
│ nombre  │ max(precio) │ min(precio) │ avg(precio) │
├─────────┼─────────────┼─────────────┼─────────────┤
│ Asus    │ 245.99      │ 202.0       │ 223.995     │
│ Crucial │ 755.0       │ 120.0       │ 437.5       │
│ Lenovo  │ 559.0       │ 444.0       │ 501.5       │
└─────────┴─────────────┴─────────────┴─────────────┘
*/
-- 20. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select f.nombre, count(p.codigo) from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante where precio >= 220 group by f.nombre;
/*
┌─────────┬─────────────────┐
│ nombre  │ count(p.codigo) │
├─────────┼─────────────────┤
│ Asus    │ 1               │
│ Crucial │ 1               │
│ Lenovo  │ 2               │
└─────────┴─────────────────┘
*/
-- 21. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
select f.nombre from producto as p join fabricante as f on p.codigo_fabricante = f.codigo group by f.nombre having sum(precio) > 1000;
/*
┌────────┐
│ nombre │
├────────┤
│ Lenovo │
└────────┘
*/
-- 22. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select f.nombre, max(p.nombre), precio from producto as p join fabricante as f on p.codigo_fabricante = f.codigo group by f.nombre;
/*
┌─────────────────┬─────────────────────────────────┬────────┐
│     nombre      │          max(p.nombre)          │ precio │
├─────────────────┼─────────────────────────────────┼────────┤
│ Asus            │ Monitor 27 LED Full HD          │ 245.99 │
│ Crucial         │ Memoria RAM DDR4 8GB            │ 120.0  │
│ Gigabyte        │ GeForce GTX 1050Ti              │ 185.0  │
│ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │ 180.0  │
│ Lenovo          │ Portátil Yoga 520               │ 559.0  │
│ Samsung         │ Disco SSD 1 TB                  │ 150.99 │
│ Seagate         │ Disco duro SATA3 1TB            │ 86.99  │
└─────────────────┴─────────────────────────────────┴────────┘
*/
--  Subconsultas (En la cláusula WHERE 0,9 obligatorio aprobar)

-- 23. Con operadores básicos de comparación

-- 24. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.nombre from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and f.nombre = 'Lenovo';
/*
┌─────────────────────┐
│       nombre        │
├─────────────────────┤
│ Portátil Yoga 520   │
│ Portátil Ideapd 320 │
└─────────────────────┘
*/
-- 25. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.* from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and precio = (select max(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo');
/*
┌────────┬───────────────────┬────────┬───────────────────┐
│ codigo │      nombre       │ precio │ codigo_fabricante │
├────────┼───────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
└────────┴───────────────────┴────────┴───────────────────┘
*/
-- 26. Lista el nombre del producto más caro del fabricante Lenovo.
select p.* from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and f.nombre = 'Lenovo' and precio = (select max(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo');
/*
┌────────┬───────────────────┬────────┬───────────────────┐
│ codigo │      nombre       │ precio │ codigo_fabricante │
├────────┼───────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
└────────┴───────────────────┴────────┴───────────────────┘
*/
-- 27. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select p.nombre from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and f.nombre = 'Hewlett-Packard' and precio = (select min(precio) from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and f.nombre = 'Hewlett-Packard');
/*
┌───────────────────────────┐
│          nombre           │
├───────────────────────────┤
│ Impresora HP Deskjet 3720 │
└───────────────────────────┘
*/
-- 28. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select p.nombre from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and precio >= (select max(precio) from producto as p, fabricante as f where f.codigo = p.codigo_fabricante and f.nombre = 'Lenovo');
/*
┌─────────────────────────┐
│         nombre          │
├─────────────────────────┤
│ GeForce GTX 1080 Xtreme │
│ Portátil Yoga 520       │
└─────────────────────────┘
*/
-- 29. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select p.nombre from producto as p join fabricante as f on f.codigo = p.codigo_fabricante where f.nombre = 'Asus' and precio >= (select avg(precio) from producto as p join fabricante as f on f.codigo = p.codigo_fabricante where f.nombre = 'Asus');
/*
┌────────────────────────┐
│         nombre         │
├────────────────────────┤
│ Monitor 27 LED Full HD │
└────────────────────────┘
*/
-- 30. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

-- 31.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.


-- Subconsultas con IN y NOT IN (0,2 obligatorio aprobar)

-- 32. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select f.nombre from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante where f.codigo in (select codigo_fabricante from producto);
/*
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Asus            │
│ Asus            │
│ Lenovo          │
│ Lenovo          │
│ Hewlett-Packard │
│ Hewlett-Packard │
│ Samsung         │
│ Seagate         │
│ Crucial         │
│ Crucial         │
│ Gigabyte        │
└─────────────────┘
*/
-- 33. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select f.nombre from fabricante as f left join producto as p on f.codigo = p.codigo_fabricante where f.codigo not in (select codigo_fabricante from producto);
/*
┌────────┐
│ nombre │
├────────┤
│ Huawei │
│ Xiaomi │
└────────┘
*/
-- Subconsultas con EXISTS y NOT EXISTS (0,2 obligatorio aprobar)

-- 34. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante as f where exists (select 1 from producto where f.codigo = codigo_fabricante);
-- 35. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante as f where not exists (select * from producto where f.codigo = codigo_fabricante);
--  Subconsultas correlacionadas (0,5 obligatorio aprobar)

-- 36. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

-- 37. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.

-- 39. Subconsultas (En la cláusula HAVING)

-- 40 .Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
