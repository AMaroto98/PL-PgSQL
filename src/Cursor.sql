DO $$
DECLARE
    -- Declaración de variables
    cur_alumnos CURSOR FOR SELECT * FROM alumnos;
    alumno alumnos%ROWTYPE;
BEGIN
    -- Abrir el cursor
    OPEN cur_alumnos;
    
    -- Leer cada fila del cursor y hacer algo con ella
    LOOP
        FETCH cur_alumnos INTO alumno;
        EXIT WHEN NOT FOUND;
        
        -- Realizar acciones con los datos de la fila
        -- imprimir los datos del alumno
        RAISE NOTICE 'ID: %, Nombre: %, Apellido 1: %, Apellido 2: %, Nota: %, Email: %',
                     alumno.id, alumno.nombre, alumno.apellido1, alumno.apellido2, alumno.nota, alumno.email;
    END LOOP;
    
    -- Cerrar el cursor
    CLOSE cur_alumnos;
END;
$$;