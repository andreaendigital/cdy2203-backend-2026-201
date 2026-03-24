-- PARTE 1: INFRAESTRUCTURA 
CREATE DATABASE IF NOT EXISTS mydatabase; -- Crear la nueva base de datos
CREATE USER IF NOT EXISTS 'myuser'@'%' IDENTIFIED BY 'password'; -- Crear usuario
GRANT ALL ON mydatabase.* TO 'myuser'@'%'; -- Dar todos los privilegios en la BD al nuevo usuario creado

-- Le decimos a MySQL que use esta base de datos para lo que sigue
USE mydatabase;

-- PARTE 2: APLICACIÓN (Crear la tabla para que Spring Security funcione)
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- PARTE 3: INSERCIÓN DE USUARIOS DE PRUEBA (Exigido en el Paso 1)
-- La contraseña para todos estos usuarios es: 1234
-- NUNCA guardamos '1234' en texto plano, guardamos su HASH generado por BCrypt
INSERT INTO user (username, email, password) 
VALUES ('admin', 'admin@veterinaria.cl', '$2a$12$R9h/cIPz0gi.URNNX3kh2OPST9/PgBkqquzi.Ss7KIUgO2t0jWMUW');

INSERT INTO user (username, email, password) 
VALUES ('veterinario1', 'vet1@veterinaria.cl', '$2a$12$R9h/cIPz0gi.URNNX3kh2OPST9/PgBkqquzi.Ss7KIUgO2t0jWMUW');

INSERT INTO user (username, email, password) 
VALUES ('asistente', 'asist@veterinaria.cl', '$2a$12$R9h/cIPz0gi.URNNX3kh2OPST9/PgBkqquzi.Ss7KIUgO2t0jWMUW');