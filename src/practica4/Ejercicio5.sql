/*
Provincia = (id_provincia, nombre)
Ciudad = (id_ciudad, nombre, id_provincia)
Canal = (id_canal, denominación, dirección, teléfono, id_ciudad)
Dibujo = (id_dibujo, nombre, descripción, año_creación)
Personaje = (id_personaje, nombre, descripción, id_dibujo)
Programación = (id_canal, id_dibujo, fecha, horario)
*/

/*1) Listar todas las ciudades de la provincia de Buenos Aires.*/

SELECT c.nombre
FROM Ciudad c NATURAL JOIN Provincia p
WHERE p.nombre = "Buenos Aires";


/*2) Listar todos los canales para la ciudad de La Plata.*/

SELECT denominación
FROM Canal NATURAL JOIN Ciudad c
WHERE c.nombre = "La Plata";


/*3) Listar todos los personajes del dibujo “Thundercats”.*/

SELECT p.nombre
FROM Personaje p NATURAL JOIN Dibujo d
WHERE d.nombre = "Thundercats";


/*4) Listar nombre y descripción de los personajes para el dibujo “Los títeres del rey”.*/

SELECT p.nombre, p.descripción
FROM Personaje p NATURAL JOIN Dibujo d
WHERE d.nombre = "Los títeres del rey";


/*5) Listar la denominación, dirección y teléfono de aquellos canales que pertenezcan a la
provincia de “San Luis” y que tengan programación para el dibujo “Thundercats”. Dicho
listado deberá estar ordenado por denominación.*/

SELECT denominación, dirección, teléfono
FROM Canal NATURAL JOIN Canal c NATURAL JOIN Provincia p INNER JOIN Programación pr ON (c.id_canal = pr.id_canal) INNER JOIN Dibujo d ON (d.id_dibujo = pr.id_dibujo)
WHERE p.nombre = "San Luis" AND d.nombre = "Thundercats"
ORDER BY denominación;


/*6) Listar el nombre y año de creación de todos los dibujos que posean año de creación
entre los años 1900 y 2000 o que tengan al menos un personaje cuyo nombre finalice
con la cadena “abe”. Dicho listado deberá estar ordenado por nombre.*/

SELECT d.nombre, d.año_creación
FROM Personaje p NATURAL JOIN Dibujo d
WHERE (d.año_creación BETWEEN 1900 AND 2000) OR p.nombre LIKE "%abe"
ORDER BY d.nombre;


/*7) Listar el identificador y el nombre de los dibujos que tengan programación en todos los
canales.*/

SELECT d.id_dibujo, d.nombre
FROM Dibujo d
WHERE NOT EXISTS( SELECT *
                  FROM Canal c
                  WHERE NOT EXISTS( SELECT *
                                    FROM Programación p
                                    WHERE p.id_canal = c.id_canal AND p.id_dibujo = c.id_dibujo
                                  )
                );

/*8) Listar el nombre y descripción de aquellos dibujos que tengan programación en la
provincia de “San Luis” y no posean programación en la provincia de “San Juan”.*/


/*9) Listar la denominación, dirección y teléfono de aquellos canales que tengan
programación para más de 10 dibujos.*/

SELECT denominación, dirección, teléfono
FROM Canal c NATURAL JOIN Programación
GROUP BY c.id_canal, denominación, dirección, teléfono
HAVING COUNT(distinct id_dibujo) > 10;
