-- Insertar datos iniciales para Perfiles
INSERT INTO Perfiles (nombre, fecha_vigencia, descripcion, encargado) VALUES
('Administrador', '2025-12-31', 'Perfil con acceso completo al sistema', 'Carlos Martinez'),
('Gerente', '2025-12-31', 'Perfil con acceso a reportes y gestión de actividades', 'Maria Lopez'),
('Recursos Humanos', '2025-12-31', 'Perfil para gestión de usuarios y actividades', 'Luis Perez'),
('Colaborador', '2025-12-31', 'Perfil estándar con acceso limitado', 'Jose Ramirez'),
('Supervisor', '2025-12-31', 'Perfil con acceso a la supervisión de actividades', 'Ana Gomez'),
('Marketing', '2025-12-31', 'Perfil para manejo de promociones y fidelización', 'Laura Diaz'),
('Ventas', '2025-12-31', 'Perfil para gestión de ventas y promociones', 'Miguel Fernandez'),
('Soporte Técnico', '2025-12-31', 'Perfil con acceso al sistema de soporte', 'David Sanchez'),
('Finanzas', '2025-12-31', 'Perfil para gestión financiera', 'Daniela Torres'),
('Desarrollo', '2025-12-31', 'Perfil para desarrollo de sistemas internos', 'Andrea Cruz');

-- Insertar datos iniciales para Usuarios (20 usuarios)
INSERT INTO Usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, perfil_id) VALUES
('Juan', 'Perez', 'Activo', '12345', 'Analista', 1500.00, '2024-01-15', 4),
('Ana', 'Rodriguez', 'Activo', '12345', 'Desarrollador', 1800.00, '2024-02-20', 10),
('Carlos', 'Gomez', 'Activo', '12345', 'Supervisor', 2000.00, '2024-03-05', 5),
('Maria', 'Fernandez', 'Activo', '12345', 'Gerente', 3500.00, '2024-04-10', 2),
('Luis', 'Martinez', 'Activo', '12345', 'Recursos Humanos', 2500.00, '2024-05-25', 3),
('Elena', 'Suarez', 'Activo', '12345', 'Marketing', 1600.00, '2024-06-15', 6),
('Jose', 'Santos', 'Activo', '12345', 'Ventas', 1700.00, '2024-07-01', 7),
('Miguel', 'Torres', 'Activo', '12345', 'Soporte Técnico', 1400.00, '2024-08-12', 8),
('Andres', 'Diaz', 'Activo', '12345', 'Finanzas', 2600.00, '2024-09-01', 9),
('Laura', 'Vargas', 'Activo', '12345', 'Administrador', 4000.00, '2024-10-20', 1);

-- Vista para listar Usuarios con su perfil
CREATE VIEW Vista_Usuarios_Perfiles AS
SELECT U.id, U.nombre, U.apellido, P.nombre AS perfil, U.estado, U.cargo, U.salario
FROM Usuarios U
JOIN Perfiles P ON U.perfil_id = P.id;

-- Procedimiento para registrar un nuevo login
DELIMITER //
CREATE PROCEDURE RegistrarLogin(IN userId INT)
BEGIN
    INSERT INTO Login (usuario_id) VALUES (userId);
END //
DELIMITER ;

-- Función para calcular puntos obtenidos por un usuario en un período de tiempo
DELIMITER //
CREATE FUNCTION CalcularPuntos(usuarioId INT, fechaInicio DATE, fechaFin DATE)
RETURNS INT
BEGIN
    DECLARE totalPuntos INT;
    SELECT SUM(puntos) INTO totalPuntos
    FROM Participaciones
    WHERE usuario_id = usuarioId AND actividad_id IN (
        SELECT id FROM Actividades WHERE fecha BETWEEN fechaInicio AND fechaFin
    );
    RETURN IFNULL(totalPuntos, 0);
END //
DELIMITER ;