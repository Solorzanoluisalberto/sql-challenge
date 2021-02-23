-- Physical Schema EmployeeSQL
-- CREATE TABLE "titles"
CREATE TABLE "titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(100)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     ),
    CONSTRAINT "uc_titles_title" UNIQUE (
        "title"
    )
);

-- CREATE TABLE "departments"
CREATE TABLE "departments" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_departments_dept_name" UNIQUE (
        "dept_name"
    )
);

-- CREATE TABLE "Employees" 
CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

-- CREATE TABLE "salaries" 
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL
);

-- CREATE TABLE "dept_manager" 
CREATE TABLE "dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" int   NOT NULL
);

-- CREATE TABLE "dept_emp" 
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(4)   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- 1) insert data for table "titles" from titles.csv.
-- command " "\\copy public.titles (title_id, title) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/titles.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
-- 2) insert data for table "titles" from departments.csv
--command " "\\copy public.departments (dept_no, dept_name) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/DEPART~1.CSV' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
-- 3) insert data for table "titles" from Employees.csv
--command " "\\copy public.\"Employees\" (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/EMPLOY~1.CSV' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
-- 4) insert data for table "titles" from salaries.csv
--command " "\\copy public.salaries (emp_no, salary) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/salaries.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
-- 5) insert data for table "titles" from dept_manager.csv
--command " "\\copy public.dept_manager (dept_no, emp_no) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/DEPT_M~1.CSV' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""
-- 6) insert data for table "titles" from dept_emp.csv
--command " "\\copy public.dept_emp (emp_no, dept_no) FROM 'C:/Users/solor/Desktop/PERSON~1/SQL-CH~1/data/dept_emp.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""

