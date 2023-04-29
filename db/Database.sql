DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
\c test;

CREATE TABLE IF NOT EXISTS alumnos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    nota FLOAT,
    email VARCHAR(50)
);
