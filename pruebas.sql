-- Listados de los Parques Naturales y sus Directores.
/*
SELECT parque_natural.nombre, operario.NOMBRE
FROM parque_natural, operario
WHERE parque_natural.Dni_Operario_Director = operario.dni
ORDER BY parque_natural.nombre
*/

-- Listdo de operarios y parque natural al que pertenecen.
/*
select operario.nombre, parque_natural.nombre
from operario, parque_natural
where operario.Nombre_ParqueNatural_Adscrito = parque_natural.nombre
order by operario.NOMBRE


-- Operadores count(), avg(), max(), min()
select max(sueldo) as 'Sueldo maximo'
from operario

*/

-- 2. Listado de operarios de la empresa, donde aparecerá el parque natural al que están adscritos cada uno.
SELECT operario.nombre AS 'Nombre Operario', parque_natural.nombre AS 'Nombre Parque Natural'
from operario, parque_natural
WHERE operario.Nombre_ParqueNatural_Adscrito = parque_natural.nombre
ORDER BY operario.NOMBRE




