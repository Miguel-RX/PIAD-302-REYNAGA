--CREAR PROCEDIMIENTOS ALMACENADOS; RESTAR, MULTILICAR, DIVIDIR, POTENCIAR.

-- RESTA --


CREATE PROC RestarNumeros
(
	@numero1 int,
	@numero2 int
)
AS 
	print '' + @numero1 - @numero2 + '';

EXEC RestarNumeros 3, 2;

-- MULTIPLICAR --

CREATE PROC MultiplicarNumeros
(
	@numero1 int,
	@numero2 int
)
AS 
	print '' + @numero1 * @numero2 + '';

EXEC MultiplicarNumeros 2, 4;

-- DIVIDIR --

CREATE PROC DividirNumeros
(
	@numero1 int,
	@numero2 int
)
AS 
	print '' + @numero1 / @numero2 + '';

EXEC DividirNumeros 8, 2;

-- POTENCIAR --

CREATE PROC PotenciarNumeros
(
	@numero1 int,
	@numero2 int
)
AS 
	print '' + POWER(@numero1, @numero2) + '';

EXEC PotenciarNumeros 2, 3;
