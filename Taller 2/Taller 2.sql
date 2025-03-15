-- Implementación de la Base de Datos para la Empresa XYZ

-- Creación de la Base de Datos
CREATE DATABASE IF NOT EXISTS EmpresaXYZ;
USE EmpresaXYZ;

-- Tabla de Perfiles
CREATE TABLE Perfiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_vigencia DATE NOT NULL,
    descripcion TEXT,
    encargado VARCHAR(100)
);

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    fecha_ingreso DATE NOT NULL,
    perfil_id INT,
    FOREIGN KEY (perfil_id) REFERENCES Perfiles(id)
);

-- Tabla de Login
CREATE TABLE Login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla de Actividades
CREATE TABLE Actividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha DATE NOT NULL
);

-- Tabla de Participaciones (relaciona Usuarios y Actividades)
CREATE TABLE Participaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    actividad_id INT,
    puntos INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (actividad_id) REFERENCES Actividades(id)
);

-- Tabla de Fidelización
CREATE TABLE Fidelizacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    perfil_id INT,
    total_puntos INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (perfil_id) REFERENCES Perfiles(id)
);