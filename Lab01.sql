--1. Visualizar todos los registros de la tabla productos.
SELECT * FROM Production.Product
--2. Ver la estructura de la tabla productos
EXEC sp_help 'Production.Product';
GO
--3. Cuantos productos no pertenecen a una subcategoría.
SELECT COUNT(ProductID) AS PRODUCTOS FROM Production.Product WHERE ProductSubcategoryID IS NULL
--4. Ver listado de subcategorías de productos
SELECT * FROM Production.ProductSubcategory
--5. Visualizar listado de subcategorías con sus respectivas categorías
SELECT C.Name AS CATEGORIA,S.Name AS SUBCATEGORIA  FROM Production.ProductSubcategory AS S
INNER JOIN Production.ProductCategory AS C ON C.ProductCategoryID = S.ProductCategoryID GROUP BY C.Name
--6. Visualizar cantidad de productos por cada subcategoría
SELECT S.Name AS SUBCATEGORIA, COUNT(P.ProductID) AS CANTIDAD  FROM Production.ProductSubcategory AS S
INNER JOIN Production.Product AS P ON P.ProductSubcategoryID = S.ProductSubcategoryID GROUP BY S.Name
--7. Ver precio promedio por cada categoría de producto
SELECT C.Name,AVG(StandardCost) AS Precio_Promedio FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
--8. Ver cantidad de productos por categoría
SELECT C.Name AS Categoria,COUNT(P.ProductID) AS CANTIDAD FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
--9. Ver cantidad de productos sólo de la categoría components
SELECT C.Name AS Categoria,COUNT(P.ProductID) AS CANTIDAD FROM Production.Product P
INNER JOIN Production.ProductSubcategory S on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C on C.ProductCategoryID = S.ProductCategoryID
WHERE C.Name = 'Components'
GROUP BY C.Name
--10. Visualizar el total de ventas por cada categoría de producto
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
--13. Ver cantidad de empleados por género
SELECT Gender, COUNT(H.BusinessEntityID) AS Genero from HumanResources.Employee H GROUP BY Gender ;
--14. Ver listado de Departamentos
SELECT * from HumanResources.Department
--15. Ver cantidad de empleados por cada departamento
SELECT D.Name AS Departamento, COUNT(E.BusinessEntityID) as Empleados from HumanResources.Employee E 
INNER JOIN HumanResources.EmployeeDepartmentHistory H on E.BusinessEntityID = H.BusinessEntityID
INNER JOIN HumanResources.Department D on D.DepartmentID = H.DepartmentID
GROUP BY D.Name