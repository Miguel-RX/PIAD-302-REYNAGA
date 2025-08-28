-- ejercicio N°01

SELECT * FROM Products;
SELECT * FROM Categories;

-- primera forma 1

SELECT ProductID , ProductName FROM Products
UNION
SELECT CategoryID , CategoryName FROM Categories

-- segunda forma 2

SELECT ProductID , ProductName FROM Products
UNION ALL
SELECT CategoryID , CategoryName FROM Categories

-------------------------------------------------------------------------------

-- EJERCICIOS N°02

/* Mostrar el total de los "Orders" y agruparlos por orderId
Nota: Para calcular el total, lo obtienes de la tabla Order details (UnirPrice * Quantity)

*/

SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT o.ShipName , SUM(od.Unitprice * od.Quantity) AS Total FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Customers c On o.CustomerID = c.CustomerID
GROUP BY o.ShipName
Order BY Total ASC;

/* Mostrar la cantidad de "orders" agrupados por el nombre del empleado
Ejemplo:
Nacy 20
janet 88
*/

SELECT * FROM Orders
SELECT * FROM Employees

SELECT e.FirstName AS Empleado, count(o.OrderID) AS Cantidad_de_Orders FROM Orders o
INNER JOIN Employees e On o.EmployeeID = e.EmployeeID
GROUP BY e.FirstName
Order by Cantidad_de_Orders ASC;