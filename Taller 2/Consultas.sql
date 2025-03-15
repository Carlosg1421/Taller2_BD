-- Consulta para identificar perfiles próximos a vencer (en 30 días o menos)
USE EmpresaXYZ;
SELECT * FROM empresaxyz.perfiles
WHERE fecha_vigencia BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);


SELECT * FROM empresaxyz.Perfiles
WHERE fecha_vigencia >= CURDATE();

SELECT * FROM empresaxyz.Perfiles
WHERE DATE(fecha_vigencia) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
