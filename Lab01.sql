--1. Visualizar todos los registros de la tabla productos.
SELECT * FROM Production.Product
--2. Ver la estructura de la tabla productos
EXEC sp_help 'Production.Product';
GO
--3. Cuantos productos no pertenecen a una subcategor�a.
SELECT COUNT(ProductID) AS PRODUCTOS FROM Production.Product WHERE ProductSubcategoryID IS NULL
--4. Ver listado de subcategor�as de productos
SELECT * FROM Production.ProductSubcategory
--5. Visualizar listado de subcategor�as con sus respectivas categor�as
SELECT C.Name AS CATEGORIA,S.Name AS SUBCATEGORIA  FROM Production.ProductSubcategory AS S
INNER JOIN Production.ProductCategory AS C ON C.ProductCategoryID = S.ProductCategoryID GROUP BY C.Name
--6. Visualizar cantidad de productos por cada subcategor�a
SELECT S.Name AS SUBCATEGORIA, COUNT(P.ProductID) AS CANTIDAD  FROM Production.ProductSubcategory AS S
INNER JOIN Production.Product AS P ON P.ProductSubcategoryID = S.ProductSubcategoryID GROUP BY S.Name
--7. Ver precio promedio por cada categor�a de producto
SELECT C.Name,AVG(StandardCost) AS Precio_Promedio FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
--8. Ver cantidad de productos por categor�a
SELECT C.Name AS Categoria,COUNT(P.ProductID) AS CANTIDAD FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
--9. Ver cantidad de productos s�lo de la categor�a components
SELECT C.Name AS Categoria,COUNT(P.ProductID) AS CANTIDAD FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
WHERE C.Name = 'Components'
GROUP BY C.Name
--10. Visualizar el total de ventas por cada categor�a de producto
SELECT C.Name, SUM(SA.LineTotal * SA.UnitPrice) as TOTAL
FROM Production.Product P
INNER JOIN Sales.SalesOrderDetail SA on P.ProductID = SA.ProductID
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name;
--11. Ver la cantidad total de empleados
SELECT COUNT(H.BusinessEntityID) AS TOTAL_EMPLEADOS FROM HumanResources.Employee H;
--12. Ver la cantidad total de empleados de acuerdo a su estado civil.
SELECT MaritalStatus, COUNT(H.BusinessEntityID) AS ESTADO_CIVIL from HumanResources.Employee H GROUP BY MaritalStatus ;
--13. Ver cantidad de empleados por g�nero
SELECT Gender, COUNT(H.BusinessEntityID) AS Genero from HumanResources.Employee H GROUP BY Gender ;
--14. Ver listado de Departamentos
SELECT * from HumanResources.Department
--15. Ver cantidad de empleados por cada departamento
SELECT D.Name AS Departamento, COUNT(E.BusinessEntityID) as Empleados from HumanResources.Employee E 
INNER JOIN HumanResources.EmployeeDepartmentHistory H on E.BusinessEntityID = H.BusinessEntityID
INNER JOIN HumanResources.Department D on D.DepartmentID = H.DepartmentID
GROUP BY D.Name