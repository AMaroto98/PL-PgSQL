CREATE OR REPLACE PROCEDURE crear_email(
    IN nombre VARCHAR(50), 
    IN apellido1 VARCHAR(50), 
    IN apellido2 VARCHAR(50), 
    OUT email VARCHAR(200))
AS $$
BEGIN
    email := concat(
        left(nombre,1),
        left(apellido1,3),
        left(apellido2,3),
        '@cifpfbmoll.eu'
        );
END $$ LANGUAGE plpgsql;

-- Para comprobar que funciona:
-- CALL crear_email('Juan'::varchar, 'Perez'::varchar, 'Garcia'::varchar, 'email'::varchar);
