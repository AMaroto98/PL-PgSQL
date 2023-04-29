CREATE OR REPLACE FUNCTION calcular_media() 
RETURNS FLOAT 
AS 
$$
DECLARE
    media FLOAT;
BEGIN
    SELECT AVG(nota) INTO media FROM alumnos;
    RETURN media;
END;
$$ LANGUAGE plpgsql;