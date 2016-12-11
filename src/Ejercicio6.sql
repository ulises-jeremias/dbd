/*
Cliente = (nro_cliente, apellido, nombre, domicilio, teléfono)
Pago = (nro_cliente, año, mes, veces_por_semana, fechaPago, importePagado)
Actividad = (codActiv, nombre)
Abono = (nro_cliente, año, mes, codActiv)
Asistencia = (codActiv, fecha, nro_cliente)
*/

/*1) Listar nombre, apellido y domicilio de todos los clientes.*/

SELECT nombre, apellido, domicilio
FROM Cliente;


/*2) Listar el número de cliente y la cantidad de veces por semana que asistió Luque Joaquín
en noviembre de 2015.*/

SELECT nro_cliente, veces_por_semana
FROM Cliente NATURAL JOIN Pago
WHERE apellido = "Luque" AND nombre LIKE "%Joaquin%" AND mes = "Noviembre" AND año = "2015";


/*3) Listar la fecha de pago del cliente 1749 para el abono a Stretching de septiembre de
2016.*/

SELECT fechaPago, ac.nombre
FROM Pago p INNER JOIN Abono a ON (p.nro_cliente = a.nro_cliente) INNER JOIN Actividad ac ON (a.codActiv = ac.codActiv)
WHERE p.nro_cliente = "1749" AND nombre = "Stretching" AND mes = "septiembre" AND año = "2016";


/*4) Ingresar la asistencia del cliente Luque Joaquín a la actividad Stretching el “15/09/2016”.*/

INSERT INTO Asistencia (codActiv, fecha, nro_cliente)
VALUES  ((SELECT nro_cliente FROM Cliente WHERE nombre = "Joaquin" AND apellido = "Luque"),
         "15/09/2016",
         (SELECT codActiv FROM Actividad WHERE nombre = "Stretching")
        );


/*5) Listar apellido y nombre de los clientes que asistieron por primera vez a “Aeróbica” entre
el 1 y el 30 de junio de 2016.*/

SELECT c.apellido, c.nombre
FROM Cliente c NATURAL JOIN Asistencia a INNER JOIN Actividad ac ON (a.codActiv = ac.codActiv)
WHERE ac.nombre = "Aeróbica"
GROUP BY c.nro_cliente, c.apellido, c.nombre
HAVING MIN(ac.fecha) BETWEEN "01/06/2016" AND "30/06/2016";


/*6) Reportar el apellido y nombre de los clientes que no asistieron a alguna actividad, entre el
14 y el 19, para la que pagaron abono en el mes de mayo de 2016.*/

SELECT c.apellido, c.nombre
FROM Cliente c NATURAL JOIN Pago p
WHERE año = "2016" AND mes = "mayo" AND NOT EXISTS( SELECT *
                                                    FROM Asistencia a
                                                    WHERE a.nro_cliente = c.nro_cliente AND fecha BETWEEN "14/05/2016" AND "19/05/2016"
                                                  );


/*7) Cambiar el abono a la actividad Stretching de Palacios Virginia de agosto de 2016 por un
abono a la actividad Aeróbica.*/

UPDATE Abono
SET codActiv = (SELECT codActiv FROM Actividad ac WHERE ac.nombre = "Aeróbica")
WHERE mes = "agosto" AND año = "2016"
                     AND nro_cliente = (SELECT nro_cliente FROM Cliente c WHERE c.nombre = "Virginia" AND apellido = "Palacios")
                     AND codActiv = (SELECT codActiv FROM Actividad ac WHERE ac.nombre = "Stretching");
