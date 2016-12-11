/*
Material = (cod_material, tipo, género, título, descripción, duración, cantidad_capítulos)
Capítulo = (cod_material, nro_capítulo, descripción)
Canal = (cod_canal, nombre, número, categoría)
Programación = (cod_canal, cod_material, fecha, hora, nro_capítulo)
*/


/*1) Listar todos los canales.*/

SELECT *
FROM Canal;


/*2) Listar todos los canales, proyectando el nombre y la categoría.*/

SELECT nombre, categoria
FROM Canal;


/*3) Listar todos los canales cuya categoría sea “Cine”, proyectando el nombre y número.*/

SELECT nombre
FROM Canal
WHERE categoria="Cine";


/*4) Listar todos los capítulos cuyo material tenga el título "La Perla".*/

SELECT c.descripcion
FROM Material m INNER JOIN Capitulo c ON (m.cod_material = c.cod_material)
WHERE m.titulo = "La Perla";


/*5) Listar todos los canales cuya cantidad de capítulos sea igual a 5.*/

SELECT c.nombre
FROM Canal c INNER JOIN Programacion p ON (c.cod_canal = p.cod_canal) INNER JOIN Material m ON (p.cod_material = m.cod_material)
WHERE m.cantidad_capitulos = 5;


/*6) Listar todos los material donde el género sea drama. Proyectar el tipo de título y la
descripción.*/

SELECT titulo, descripcion
FROM Material
WHERE genero = "Drama";


/*7)Listar la programación para el canal 9, incluyendo el material, la fecha y la hora.*/

SELECT m.descripcion, p.fecha, p.hora
FROM Programacion p INNER JOIN Canal c ON (p.cod_canal = c.cod_canal) INNER JOIN Material m ON (p.cod_material = m.cod_material)
WHERE c.numero = 9;


/*8) Asignar 0 al campo cantidad de capítulos y ‘null’ al campo tipo a aquellos materiales que
posean programación en un único canal.*/

UPDATE Material
SET cantidad_capitulos='0', tipo='null')
WHERE 1 = (SELECT COUNT(cod_canal)
          FROM Canal c INNER JOIN Programacion p ON (c.cod_canal = p.cod_canal));


/*9) Listar el título, género y descripción del material que se emitirá hoy de tipo "serie" y que
incluya el término "drama" en género.*/

SELECT m.titulo, m.genero, m.descripcion
FROM Programacion p INNER JOIN Canal c ON (p.cod_canal = c.cod_canal) INNER JOIN Material m ON (p.cod_material = m.cod_material)
WHERE p.fecha = CURRENT_DATE AND m.tipo = "serie" AND m.genero LIKE "%drama%";


/*10) Listar nombre y número de aquellos canales que poseen programación para todos los
materiales. Debe resolver utilizando la cláusula Not Exists.*/

SELECT nombre, numero
FROM Canal c
WHERE NOT EXISTS (SELECT *
                  FROM Material m
                  WHERE NOT EXISTS (SELECT *
                                    FROM Programacion p
                                    WHERE c.cod_material = p.cod_material
                  ));


/*11) Listar título, descripción, tipo y duración de aquellos materiales que posean programación
para todos sus capítulos.*/

SELECT titulo, tipo, duracion, descripcion
FROM Material m
WHERE NOT EXISTS (SELECT *
                  FROM Canal c
                  WHERE NOT EXISTS (SELECT *
                                    FROM Programacion p
                                    WHERE c.cod_canal = p.cod_canal
                  ));


/*12) Listar para cada material, el título, descripción y la cantidad de canales distintos en los
que tiene programación.*/

SELECT titulo, descripcion, COUNT(distinct cod_canal) AS cantidad
FROM Material m INNER JOIN Programacion p ON (m.cod_material = p.cod_material);
