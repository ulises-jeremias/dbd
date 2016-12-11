-- 1.a
SELECT nombre, apellido
FROM persona LEFT JOIN registro ON (id = id_persona)
WHERE isnull(id_persona);

SELECT nombre, apellido
FROM persona
WHERE id NOT IN (SELECT id_persona
				 FROM registro);

-- 1.b
SELECT nombre, apellido
FROM persona p
WHERE NOT EXISTS ( SELECT id_persona
				   FROM registro r
				   WHERE p.id = r.id_persona
				);

-- 2
SELECT nombre, apellido, SUM(calorias) AS consumo_calorico_total
FROM persona INNER JOIN registro ON (id = id_persona)
WHERE nombre = "Juan" AND apellido = "Perez" AND fecha = "2016-09-15";


-- 3
SELECT 
    fecha, SUM(calorias) AS calorias_diarias
FROM
    persona
        INNER JOIN
    registro ON (id = id_persona)
WHERE
    nombre = 'Juan' AND apellido = 'Perez'
        AND fecha LIKE '2016-09-%'
GROUP BY fecha
ORDER BY fecha;


-- 4
SELECT
    p.dni,
    p.nombre,
    apellido,
    TIMESTAMPDIFF(YEAR,
        fecha_nac,
        CURRENT_DATE) AS edad,
    fecha,
    a.nombre,
    r.calorias
FROM
    persona p
        INNER JOIN
    registro r ON (p.id = r.id_persona)
        INNER JOIN
    alimento a ON (a.id = r.id_alimento)
ORDER BY apellido , p.nombre, fecha DESC, r.calorias DESC;


-- 5

SELECT 
    id, nombre, apellido, SUM(grasas) AS algo
FROM
    persona
        INNER JOIN
    registro ON (id = id_persona)
WHERE
    fecha LIKE '2016%'
GROUP BY id_persona
ORDER BY algo DESC
LIMIT 1; 

-- 6.a
SELECT a.nombre
FROM alimento a
WHERE NOT EXISTS ( SELECT *
				   FROM persona p
                   WHERE p.fecha_nac LIKE "1990%" AND NOT EXISTS ( SELECT *
									FROM registro r
									WHERE r.id_alimento = a.id AND r.id_persona = p.id
									)
				         );

-- 6.b
SELECT a.nombre
FROM persona p INNER JOIN registro r ON (p.id = id_persona) INNER JOIN alimento a ON (a.id = id_alimento)
WHERE fecha_nac LIKE "1990%"
GROUP BY a.nombre HAVING COUNT(distinct id_persona) = (SELECT COUNT(id)
													   FROM persona
													   WHERE fecha_nac LIKE "1990%");