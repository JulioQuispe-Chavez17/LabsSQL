--LAB_03_01
/*Debido a problemas presupuestarios, el departamento de recursos humanos necesita un informe que muestre el apellido y el salario de los empleados que ganan más de 12.000 dólares.
Guarde la sentencia SQL como un archivo denominado lab_02_01.sql. Ejecute la consulta*/
SELECT last_name,salary  FROM HR.employees
WHERE salary > 12000;

--LAB_03_02
/*Abra una hoja de trabajo de SQL nueva. Cree un informe que muestre el apellido y el número de departamento para el número de empleado 176.*/
SELECT last_name, department_id FROM HR.employees
WHERE employee_id = 176;

--LAB_03_03
 /*El departamento de recursos humanos necesita encontrar los empleados con salarios tanto altos como bajos. Modifique lab_02_01.sql
 para mostrar el apellido y el salario de todos los empleados cuyo salario no esté entre 5.000 y 12.000 dólares. Guarde la sentencia SQL como lab_02_03.sql.*/
SELECT last_name,salary  FROM HR.employees
WHERE salary NOT IN(5000,12000);

--LAB_03_04
/*Cree un informe para mostrar el apellido, ID de cargo y fecha de contratación de los empleados cuyos apellidos sean Matos y Taylor.
Ordene la consulta en orden ascendente por fecha de contratación.*/
SELECT last_name, job_id, hire_date FROM HR.employees
WHERE last_name = 'Matos' OR last_name = 'Taylor';

--LAB_03_05
/*Muestre el apellido y el ID de departamento de todos los empleados de los departamentos 20 o 50 en orden alfabético ascendente por nombre.*/
SELECT last_name, department_id FROM HR.employees
WHERE department_id IN (20,50)
ORDER BY department_id ASC;

SELECT last_name, department_id FROM HR.employees
WHERE department_id = 20 OR department_id = 50
ORDER BY department_id ASC;

--LAB_03_06
/*Modifique el archivo lab_02_03.sql para mostrar el apellido y el salario de los empleados que ganan entre 5.000 y 12.000 dólares y están en el departamento 20 o 50.
Etiquete las columnas Employee y Monthly Salary, respectivamente. Vuelva a guardar lab_02_03.sql como lab_02_06.sql . Ejecute la sentencia en el archivo lab_02_06.sql.*/
SELECT last_name as Employee,salary as Monthly_Salary  FROM HR.employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20,50);

--LAB_03_07
/*El departamento de recursos humanos necesita un informe que muestre el apellido y la fecha de contratación de todos los empleados contratados durante el año 2006.*/
SELECT last_name,hire_date FROM HR.employees
WHERE hire_date LIKE '%06';

--LAB_03_08
/*Cree un informe para mostrar el apellido y el puesto de todos los empleados que no tienen un supervisor.*/
SELECT last_name, job_id
FROM HR.employees
WHERE manager_id IS NULL;

--LAB_03_09
/*Cree un informe para mostrar el apellido, salario y comisión de todos los empleados que perciben comisiones. Ordene los datos en orden descendente de salario y comisiones.
Utilice la posición numérica de la columna en la cláusula ORDER BY.*/
SELECT last_name, salary, commission_pct
FROM HR.employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

--LAB_03_10
/*Los miembros del departamento de recursos humanos desean tener más flexibilidad con las consultas que está creando.
Les gustaría tener un informe que muestre el apellido y el salario de los empleados que ganen más de una cantidad especificada por el usuario después de una solicitud. (Puede utilizar la consulta creada en el ejercicio práctico 1 y modificarla).
Guarde esta consulta en un archivo denominado lab_02_10.sql.*/ 
SELECT last_name, salary
FROM HR.employees
WHERE 
salary > &sal_amt;

--LAB_03_11
/*El departamento de recursos humanos desea ejecutar informes basados en un supervisor. Cree una consulta que solicite al usuario un ID de supervisor y genere el ID de empleado, apellido, salario y departamento de los empleados de ese supervisor. El departamento de recursos humanos desea ordenar el informe en una columna seleccionada. Puede probar los datos con los siguientes valores:
manager _id = 103, ordenado por last_name
manager_id = 108, ordenado por salary
manager_id = 124, ordenado por employee_id*/

SELECT employee_id, last_name, salary, department_id
FROM HR.employees
WHERE manager_id = &mgr_num
ORDER BY &order_col;

--LAB_03_12
/*Muestre todos los apellidos de los empleados cuya tercera letra sea una "a".*/
SELECT last_name
FROM HR.employees
WHERE last_name LIKE '__a%';

--LAB_03_13
/*Muestre los apellidos de los empleados que tengan una "a" y una "e" en su apellido.*/
SELECT last_name
FROM HR.employees
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';

--LAB_03_14
/*Muestre el apellido, cargo y salario de todos los empleados que sean vendedores u oficinistas en el departamento de stock y cuyo salario no sea igual que 2.500, 3.500 o 7.000 dólares.*/
SELECT last_name, job_id, salary
FROM HR.employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);

--LAB_03_15
 /*Modifique el archivo lab_02_06.sql para mostrar el apellido, salario y comisión de todos los empleados cuya comisión sea del 20%. Vuelva a guardar lab_02_06.sql como lab_02_15.sql.
 Vuelva a ejecutar la sentencia en el archivo lab_02_15.sql.*/
SELECT last_name as "Employee", salary as "Monthly Salary",commission_pct
FROM HR.employees
WHERE commission_pct = .20;