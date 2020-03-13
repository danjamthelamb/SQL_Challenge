-- # List the following details of each employee: employee number, first name ,last name, gender, salary.
CREATE VIEW employee_info AS
SELECT employees.Employee_Number, employees.First_Name, employees.Last_Name, employees.Gender, salaries.Salary
FROM salaries
INNER JOIN employees ON
employees.Employee_Number=salaries.Employee_Number;



-- # List the employee who were hired in 1986.
CREATE VIEW employees_1986 AS
SELECT employees.Employee_Number, employees.First_Name, employees.Last_Name
FROM employees
where employees.Hire_Date LIKE '%1986%';



-- # List the manager of each department with the following information: 
-- # department number, department name, the manager's employee number, 
-- # last name, first name, and start and end employment dates.
CREATE VIEW manager_info AS
SELECT dm.Employee_Number, e.First_Name, e.Last_Name, d.Department_Name, dm.From_Date, dm.To_Date
FROM departments AS d
INNER JOIN dept_manager AS dm ON
d.Department_Number=dm.Department_Number
INNER JOIN employees AS e ON
e.Employee_Number = dm.Employee_Number;

-- # List the department of each employee with the following information: 
-- # employee number, last name, first name, and department name.
CREATE VIEW dept_emp_info AS
SELECT e.Employee_Number, e.First_Name, e.Last_Name, d.Department_Name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.Employee_Number=de.Employee_Number
INNER JOIN departments AS d ON
d.Department_Number=de.Department_Number;

-- # List all employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Hercules AS
SELECT e.First_Name, e.Last_Name
FROM employees AS e
WHERE e.First_Name LIKE 'Hercules' AND e.Last_Name LIKE 'B%';

-- # List all employees in the Sales department, 
-- # including their employee number, last name, first name, and department name.
CREATE VIEW Sales_Emp AS
SELECT e.Employee_Number, e.First_Name, e.Last_Name, d.Department_Name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.Employee_Number=de.Employee_Number
INNER JOIN departments AS d ON
d.Department_Number=de.Department_Number
WHERE d.Department_Name = 'Sales';

-- # List all employees in the Sales and Development departments, 
-- # including their employee number, last name, first name, and department name.
CREATE VIEW Sales_Development_Emp AS
SELECT e.Employee_Number, e.First_Name, e.Last_Name, d.Department_Name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.Employee_Number=de.Employee_Number
INNER JOIN departments AS d ON
d.Department_Number=de.Department_Number
WHERE d.Department_Name = 'Sales' or d.Department_Name = 'Development';

-- # In descending order, list the frequency count of employee last names,
-- # i.e., how many employees share each last name.
CREATE VIEW Last_Name_Count AS
SELECT Last_Name , COUNT(Last_Name)
FROM employees
GROUP BY Last_Name
ORDER BY COUNT(Last_Name) DESC;