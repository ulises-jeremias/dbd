/*
Persona = (DNI, apellido, nombre, fecha_nacimiento, estado_civil, genero)
Alumno = (DNI, legajo, año_ingreso)
Profesor = (DNI, matricula, nro_expediente)
Titulo = (cod_titulo, nombre, descripción)
Titulo_Profesor = (cod_titulo, DNI, fecha)
Curso = (cod_curso, Nombre, descripción, fecha_creacion, duracion)
Alumno_Curso = (DNI, cod_curso, año, desempeño, calificación)
Profesor_Curso = (DNI, cod_curso, fecha_desde, fecha_hasta)
*/

/*1)*/

SELECT DNI, legajo, nombre, apellido
FROM Alumno a INNER JOIN Persona p ON (a.DNI = p.DNI);

/*2)*/

SELECT DNI, matrícula, apellido, nombre
FROM Profesor pr INNER JOIN Persona p ON (pr.DNI = p.DNI);

/*3)*/

SELECT t.nombre
FROM Titulo t INNER JOIN Titulo_Profesor tp ON (t.cod_titulo = tp.cod_titulo) INNER JOIN Persona p ON (pr.DNI = p.DNI)
WHERE p.apellido = "Garcia" AND p.nombre = "Pedro";

/*4)*/

SELECT c.Nombre, c.descripcion
FROM Curso c INNER JOIN Alumno_Curso ac ON (c.cod_curso = ac.cod_curso) INNER JOIN Alumno a ON (ac.DNI = a.DNI) INNER JOIN Persona p ON (a.DNI = p.DNI)
WHERE p.apellido = "Perez" AND p.nombre = "Juan";

/*5)*/

SELECT DNI, apellido, nombre, genero, fecha_nacimiento
FROM Alumno a INNER JOIN Persona p ON (a.DNI = p.DNI)
WHERE 23 < TIMESTAMPDIFF(YEAR,fecha_nac,CURRENT_DATE)
GROUP BY DNI;

/*6)*/

SELECT DNI, apellido, nombre, matrícula
FROM Profesor pr INNER JOIN Persona p ON (pr.DNI = p.DNI)
GROUP BY DNI HAVING 3 < (SELECT COUNT(*)
                         FROM Titulo t INNER JOIN Titulo_Profesor tp ON (t.cod_titulo = tp.cod_titulo)
                         WHERE pr.DNI = tp.DNI
                        )
ORDER BY apellido, nombre;

/*7)*/

SELECT DNI, apellido, nombre, SUM(duracion)
FROM Profesor pr INNER JOIN Profesor_Curso pc ON (pr.DNI = pc.DNI) INNER JOIN Curso c ON (pc.cod_curso = c.cod_curso)
GROUP BY DNI
ORDER BY apellido, nombre;

/*9)*/

SELECT c.Nombre, c.descripcion, c.fecha_creacion
FROM Curso c
GROUP BY c.cod_curso
ORDER BY c.duracion DESC
LIMIT 1;


SELECT c.Nombre, c.descripcion, c.fecha_creacion
FROM Curso c
GROUP BY c.cod_curso
ORDER BY c.duracion
LIMIT 1;

/*10)*/

SELECT DNI, apellido, nombre, legajo, año_ingreso
FROM Alumno a INNER JOIN Persona p ON (a.DNI = p.DNI)
WHERE NOT EXISTS (SELECT *
                  FROM Curso c
                  WHERE NOT EXISTS (SELECT *
                                    FROM Alumno_Curso ac
                                    WHERE ac.cod_curso = c.cod_curso
                                   )
                 );
