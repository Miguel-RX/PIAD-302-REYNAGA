-- Dos triguers en 1

CREATE TRIGGER trigger_multiple_users ON Users
AFTER
	UPDATE, DELETE
AS 
	IF EXISTS (SELECT * FROM deleted) AND EXISTS (SELECT * FROM inserted)

		INSERT INTO UserLogs([action],[user],[date])
		VALUES('UPDATEV', SUSER_NAME(),SYSDATETIME());

	ELSE IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)

		INSERT INTO UserLogs([action],[user],[date])
		VALUES('DELETEV', SUSER_NAME(),SYSDATETIME());

-- prueba

SELECT * FROM UserLogs;
SELECT * FROM Users;

UPDATE Users SET nombre = 'Jorge Martinez Martinez' WHERE id = 1;
UPDATE Users SET nombre = 'Jorge Quispe Quispe' WHERE id = 2;

DELETE FROM Users WHERE id = 1;


--insertar datos
INSERT INTO Users (id, nombre)
VALUES (1, 'Juan Pérez Martinez');

INSERT INTO Users (id, nombre)
VALUES (2, 'Jorge Quispe Mamani');


-- eliminar trigguers anteriores ---

DROP TRIGGER IF EXISTS trigger_delete_users;
DROP TRIGGER IF EXISTS trigger_update_users;