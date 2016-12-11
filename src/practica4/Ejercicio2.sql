/*
Socio = (cod_socio, DNI, apellido, nombre, fecha_nacimiento, fecha_ingreso)
Libro = (ISBN, titulo, cod_genero, descripcion)
Copia = (ISBN, nro_ejemplar, estado)
Editorial = (cod_editorial, denominacion, telefono, calle, numero, piso, depto)
Libro_Editorial = (ISBN, cod_ editorial, año_edicion)
Genero = (cod_genero, Nombre)
Prestamo = (nro_prestamo, cod_socio, ISBN, nro_ejemplar, fecha_prestamo, fecha_devolucion)
*/

/*13) Listar dni, apellido, nombre y fecha de ingreso de todos los socios de la biblioteca.*/

SELECT DNI, nombre, apellido, fecha_ingreso
FROM Socio;


/*14) Listar apellido, nombre y fecha de nacimiento de los socios cuya fecha de ingreso sea
posterior a 10/10/2013.*/

SELECT apellido, nombre, fecha_nacimiento
FROM Socio
WHERE fecha_ingreso = "10/10/2013";


/*15) Listar todos los libros, proyectando ISBN, título y descripción.*/

SELECT ISBN, titulo, descripcion
FROM Libro;

/*16) Listar todos los libros cuyo género sea “Romántico”.*/

SELECT titulo
FROM Libro l INNER JOIN Genero g ON (l.cod_genero = g.cod_genero)
WHERE g.Nombre = "Romantico";

/*17) Listar todos los libros cuyo estado de la copia sea “Excelente”.*/

SELECT l.titulo
FROM Libro l INNER JOIN Copia c ON (l.ISBN = c.ISBN)
WHERE c.estado = "Excelente";

/*18) Listar todas las editoriales, proyectando la dominación, teléfono y calle.*/

SELECT denominacion, telefono, calle
FROM Editorial;

/*19) Listar el apellido y nombre de aquellos socios que hayan ingresado en el mes de
septiembre. Dicho listado deberá estar ordenado alfabéticamente.*/

SELECT s.nombre, s.apellido
FROM Socio s
WHERE fecha_ingreso LIKE "%/09/%"
ORDER BY apellido, nombre;


/*20) Listar el título, nombre de género y descripción de aquellos libros editados por la editorial
“Nueva Editorial”. Dicho listado deberá estar ordenado por título y género.*/

SELECT l.titulo, g.Nombre, l.descripcion
FROM Libro l INNER JOIN Genero g ON (l.cod_genero = g.cod_genero) INNER JOIN Libro_Editorial le ON (l.ISBN = le.ISBN) INNER JOIN Editorial e ON (le.cod_editorial = e.cod_editorial)
WHERE e.denominacion = "Nueva Editorial"
ORDER BY l.titulo, g.Nombre;


/*21) Listar el apellido, nombre, fecha de nacimiento y cantidad de préstamos de aquellos
socios que tengan actualmente más de 10 préstamos en su poder. Dicho listado deberá
estar ordenado mostrando primero las personas con mayor cantidad de préstamos, luego
por apellido y nombre.*/

SELECT s.apellido, s.nombre, s.fecha_nacimiento, COUNT(*) AS cant_prestamos
FROM Socio s INNER JOIN Prestamo p ON (s.cod_socio = p.cod_socio)
WHERE p.fecha_devolucion IS NULL
GROUP BY s.cod_socio HAVING 10 < (SELECT COUNT(*)
                                  FROM Prestamo p
                                  WHERE p.cod_socio = s.cod_socio
                                 )
ORDER BY cant_prestamos DESC, s.apellido, s.nombre;


/*22) Listar el DNI, apellido y nombre de aquellos socios que tengan préstamos sin devolver de
libros editados por la editorial “Gran Editorial”. Dicho listado deberá estar ordenado por
apellido y nombre.*/

SELECT s.DNI, s.apellido, s.nombre
FROM Socio s INNER JOIN Prestamo s ON (s.cod_socio = p.cod_socio) INNER JOIN Libro_Editorial le ON (le.ISBN = s.ISBN) INNER JOIN Editorial e ON (e.cod_editorial = le.cod_editorial)
WHERE p.fecha_devolucion IS NULL AND e.denominacion = "Gran Editorial"
GROUP BY s.cod_socio
ORDER BY s.apellido, s.nombre;


/*23) Proyectar la cantidad de socios que tienen actualmente libros prestados cuyo estado sea
“Bueno”.*/

SELECT COUNT(*) AS cant_buenos
FROM Prestamo p (s.cod_socio = p.cod_socio) INNER JOIN Copia c ON (p.ISBN = c.ISBN)
WHERE c.estado = "Bueno"
GROUP BY p.cod_socio;


/*24) Listar el título, género, denominación de la editorial y año de edición de aquellos libros
editados entre los años 1980 y 2000. Dicho listado deberá estar ordenado por año de
edición y título del libro.*/

SELECT l.titulo, l.genero, e.denominacion, le.año_edicion
FROM Libro l INNER JOIN Libro_Editorial le ON (l.ISBN = le.ISBN) INNER JOIN Editorial e ON (le.cod_editorial = e.cod_editorial)
WHERE le.año_edicion BETWEEN 1980 AND 2000
GROUP BY l.ISBN
ORDER BY le.año_edicion, l.titulo;


/*25) Agréguese Ud. mismo como nuevo socio.*/

INSERT INTO Socio (DNI, apellido, nombre, fecha_nacimiento, fecha_ingreso)
VALUES ('40061106', 'Cornejo Fandos', 'Ulises Jeremias', '24/11/1996', CURRENT_DATE);


/*26) Modificar el título del libro cuyo ISBN es 2222-2020 por el titulo “El Código”.*/

UPDATE Libro
SET titulo='El Código'
WHERE ISBN='2222-2020';


/*27) Listar para cada género, la cantidad de préstamos en los que participó. Dicho listado
deberá estar ordenado en forma descendente de acuerdo a la cantidad de préstamos
resultante para cada género.*/

SELECT g.Nombre, COUNT(*) AS CantidadPrestamos
FROM Genero g INNER JOIN Libro l ON (g.cod_genero = l.cod_genero) INNER JOIN Prestamo p ON (l.ISBN = p.ISBN)
GROUP BY g.Nombre
ORDER BY CantidadPrestamos;
