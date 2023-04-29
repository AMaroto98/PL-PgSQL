-- A diferencia de PL/SQL en PLpgSQL se define la lógica del Trigger en una función y en el trigger se llama a la función.
-- Pongo los nombres con "_" porque dentro de Postgres no hay distinción de mayúsculas y minúsculas.

CREATE OR REPLACE FUNCTION check_nota_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nota < 0 THEN
        NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN 
        NEW.nota = 10;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
EXECUTE FUNCTION check_nota_before_insert();



CREATE OR REPLACE FUNCTION check_nota_before_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nota < 0 THEN
        NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN 
        NEW.nota = 10;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_nota_before_Update
BEFORE UPDATE ON alumnos
FOR EACH ROW
EXECUTE FUNCTION check_nota_before_update();

-- Comandos para eliminar Triggers y funciones:

-- DROP TRIGGER trigger_check_nota_before_insert ON alumnos;

-- DROP FUNCTION trigger_check_nota_before_insert();