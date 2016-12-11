/*1)Listar todas las zonas que tengan el cine con nombre “Cinema La Plata”.*/

SELECT NombreZona
FROM Zona NATURAL JOIN Cine
WHERE NombreCine = "Cinema La Plata";


/*2) Listar título, género y duración de las películas que tengan el string "Harry".*/

SELECT Título, Género, Duración
FROM Película
WHERE Sinopsis LIKE "%Harry%" OR Título LIKE "%Harry%";


/*3) Listar el nombre y ubicación de todos los cines de la zona “La Plata” que tengan función
para la película “Spiderman 3”. Dicho listado deberá estar ordenado por nombre.*/

SELECT NombreCine, Ubicacion
FROM Cine c NATURAL JOIN Zona INNER JOIN Función f ON (c.idCine = f.idCine) INNER JOIN Película p ON (f.idPelícula = p.idPelícula)
WHERE NombreZona = "La Plata" AND Título = "Spiderman 3"
ORDER BY NombreCine;


/*4) Listar el título, calificación y sinopsis de todas las películas dirigidas por “Oliver Stone” y
que tengan al menos un actor cuyo nombre contenga el string “ab”. Dicho listado deberá
estar ordenado por título.*/

SELECT Título, Calificación, Sinopsis
FROM Película p INNER JOIN Dirección d ON (p.idPelícula = d.idPelícula) INNER JOIN ActorDirector ad ON (ad.idAD = d.idAD) INNER JOIN Actuación a ON (a.idPelicula = p.idPelicula) INNER JOIN ActorDirector ad2 ON (a.idAD = ad2.idAD)
WHERE ad2.NombreAD = "Oliver Stone" AND ad2.NombreAD LIKE "%ab%";


/*5) Listar los títulos de las películas que tengan función en todas las zonas.*/

SELECT Título
FROM Película p
WHERE NOT EXISTS ( SELECT *
                   FROM Zona z
                   WHERE NOT EXISTS ( SELECT *
                                      FROM Cine c INNER JOIN Función f ON (c.idCine = f.idCine)
                                      WHERE c.idZona = z.idZona
                                    )
                  );


/*6) Listar el nombre y ubicación de aquellos cines que tengan función para más de 5
películas. Dicho listado deberá estar ordenado por nombre en forma descendente.*/

SELECT NombreCine, Ubicacion
Cine c INNER JOIN Función f ON (c.idCine = f.idCine)
GROUP BY c.NombreCine, Ubicacion
HAVING COUNT(distinct f.idPelícula) > 5
ORDER BY NombreCine DESC;


/*7) Listar la cantidad de cines distintos en las que se exhibe cada película y proyectar
además el titulo de la misma. Dicho listado deberá estar ordenado por cantidad en orden
descendente.*/

SELECT Título, COUNT(distinct c.idCine) AS CantidadCines
FROM Película p INNER JOIN Función f ON (p.idPelícula = f.idPelícula) INNER JOIN Cine c ON (f.idCine = c.idCine)
GROUP BY p.Título
ORDER BY CantidadCines DESC;


/*8) Listar para cada zona la cantidad de películas distintas que se exhiben. Dicho listado
deberá estar ordenado por cantidad.*/

SELECT NombreZona, COUNT(distinct f.idPelícula) AS CantidadPeliculas
FROM Zona NATURAL JOIN Cine c INNER JOIN Función f ON (c.idCine = f.idCine)
GROUP BY NombreZona
ORDER BY CantidadPeliculas;
