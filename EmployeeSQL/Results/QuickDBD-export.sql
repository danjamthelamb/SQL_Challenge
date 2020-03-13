-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "DepartmentNum" string   NOT NULL,
    "DepartmentName" string   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentNum"
     )
);

CREATE TABLE "DeptEmp" (
    "EmployeeNum" int   NOT NULL,
    "DepartmentNum" string   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "DeptManager" (
    "DepartmentNum" string   NOT NULL,
    "EmployeeNumber" string   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "Employees" (
    "EmployeeNum" string   NOT NULL,
    "BirthDate" date   NOT NULL,
    "FirstName" string   NOT NULL,
    "LastName" string   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmployeeNum"
     )
);

CREATE TABLE "Salaries" (
    "EmployeeNum" string   NOT NULL,
    "Salary" int   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

CREATE TABLE "Titles" (
    "EmployeeNum" string   NOT NULL,
    "Title" string   NOT NULL,
    "FromDate" date   NOT NULL,
    "ToDate" date   NOT NULL
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_DepartmentNum" FOREIGN KEY("DepartmentNum")
REFERENCES "DeptManager" ("DepartmentNum");

ALTER TABLE "DeptEmp" ADD CONSTRAINT "fk_DeptEmp_EmployeeNum" FOREIGN KEY("EmployeeNum")
REFERENCES "Employees" ("EmployeeNum");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_DepartmentNum" FOREIGN KEY("DepartmentNum")
REFERENCES "DeptEmp" ("DepartmentNum");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "Salaries" ("EmployeeNum");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_EmployeeNum" FOREIGN KEY("EmployeeNum")
REFERENCES "Titles" ("EmployeeNum");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeNum" FOREIGN KEY("EmployeeNum")
REFERENCES "Employees" ("EmployeeNum");

