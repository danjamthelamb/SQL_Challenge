CREATE TABLE departments (
    Department_Number VARCHAR(15) PRIMARY KEY,
	Department_Name VARCHAR(255)
     );

Select * FROM departments

CREATE TABLE dept_emp (
    Employee_Number INT,
    Department_Number VARCHAR(15),
    From_Date VARCHAR(15),
    To_Date VARCHAR(15),
	FOREIGN KEY (Department_Number) REFERENCES departments(Department_Number)
);

Select * FROM dept_emp

CREATE TABLE dept_manager (
    Department_Number VARCHAR(15),
    Employee_Number INT,
    From_Date VARCHAR(15),
    To_Date VARCHAR(15),
	FOREIGN KEY (Department_Number) REFERENCES departments(Department_Number),
	FOREIGN KEY (Employee_Number) REFERENCES Employees(Employee_Number)
);

Select * FROM dept_manager

CREATE TABLE employees (
    Employee_Number INT PRIMARY KEY,
    Birth_Date VARCHAR(30),
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
	Gender VARCHAR(30),
    Hire_Date VARCHAR(30)
     );
	 
Select * FROM employees
	 

CREATE TABLE salaries (
    Employee_Number INT,
    Salary INT,
    From_Date VARCHAR(30),
    To_Date VARCHAR(30),
	FOREIGN KEY (Employee_Number) REFERENCES Employees(Employee_Number)
);

Select * FROM salaries

CREATE TABLE titles (
    Employee_Number INT,
    Title VARCHAR(30),
    From_Date VARCHAR(30),
    To_Date VARCHAR(30),
	FOREIGN KEY (Employee_Number) REFERENCES Employees(Employee_Number)
);

Select * FROM titles