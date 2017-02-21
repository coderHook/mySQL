-- 1. Listado de Operarios de la empresa.
SELECT NOMBRE
FROM operario

-- 2. Listado de operarios de la empresa, donde aparecerá el parque natural al que están adscritos cada uno.
SELECT operario.nombre, parque_natural.nombre
from operario, parque_natural
WHERE operario.Nombre_ParqueNatural_Adscrito = parque_natural.nombre
ORDER BY operario.NOMBRE

-- 3. Listado de los parques naturales operados por la empresa, junto con el número de operarios 
-- adscritos que cada uno tiene. Ordenados de mayor a menor número de operarios.
SELECT parque_natural.nombre, count(*) AS 'Nº Operarios'
FROM parque_natural, operario
WHERE parque_natural.NOMBRE = operario.Nombre_ParqueNatural_Adscrito
GROUP BY parque_natural.nombre
ORDER BY 2 DESC -- La ordern DESC ordena descendientemente lo cual es justo lo que buscamos en este ejemplo.

-- 4.Listado de los safaris del parque “Serengueti” que tengan una duración
--   inferior a 2 horas y en los que se puedan observar animales de la especie
--   “Leon” o de la especie “Leopardo”.
SELECT safari.NOMBRE
FROM safari, contempla
WHERE safari.Nombre_Parque_Oferta = 'Serengueti' AND safari.DURACION < 2 
		AND (contempla.Nombre_Safari_Contempla = safari.NOMBRE AND (contempla.Nombre_Especie_Animal_Contempla = 'Leon' OR contempla.Nombre_Especie_Animal_Contempla = 'Leopardo'))
GROUP BY safari.NOMBRE


-- 5.Listado de las safaris en los que se puedan observar 3 o más especies
-- diferentes de animales y que estén ofertados en parques naturales que
-- sean patrimonio de la humanidad.

Select s.NOMBRE From SAFARI as s
JOIN PARQUE_NATURAL p On s.Nombre_Parque_Oferta = p.NOMBRE
JOIN CONTEMPLA c On s.NOMBRE = c.Nombre_Safari_Contempla
JOIN ESPECIE e On e.NOMBRE = c.Nombre_Especie_Animal_Contempla
WHERE P.PATRIMONIO_DE_LA_HUMANIDAD = 'SI' OR  p.PATRIMONIO_DE_LA_HUMANIDAD = 'YES'


-- 6.Sueldo medio de los operarios coordinadores de aquellos parques
-- 	naturales de “Tanzania” que oferten un único safari.

SELECT AVG(operario.SUELDO) AS 'SUELDO MEDIO'
FROM operario, parque_natural, safari
WHERE parque_natural.Dni_Operario_Director = operario.DNI AND parque_natural.PAIS = 'TANZANIA' 
		AND Nombre_Parque_Oferta IN (select Nombre_Parque_Oferta from safari group by Nombre_Parque_Oferta having count( * ) = 1 )



-- 7. Número medio de vehículos por parque natural que tiene la empresa (se pide un único valor)
select count(*)/(select count(*) from parque_natural) as 'Nº Medio de vehiculos'
from vehiculo;




