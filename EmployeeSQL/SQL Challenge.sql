-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select E.emp_no "employee number", E.last_name "last name", E.first_name "first name", E.sex, S.salary 
From "Employees" E
Join "salaries" S ON E.emp_no = S.emp_no
order by E.emp_no;
-- = 300024 rows affected 

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
Select first_name "first name", last_name "last name",  hire_date  "hire date"
From "Employees"
Where (Select EXTRACT (YEAR From hire_date)) = 1986
order by emp_no;
-- = 36150 rows affected

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
Select DM.dept_no "department number", D.dept_name "department name", 
	   E.emp_no "manager employee number", 
	   E.last_name "last name", E.first_name "first name"
From "Employees" as E
Join dept_manager as DM
On E.emp_no = DM.emp_no
Join departments D
On DM.dept_no = D.dept_no
Order by DM.dept_no, E.emp_no;
-- = 24 rows affected

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
Select E.emp_no "employee number", E.last_name "last name", E.first_name "first name", 
	   D.dept_name "department name"
From "Employees" as E
Join dept_emp as DE
On E.emp_no = DE.emp_no
Join departments D
On DE.dept_no = D.dept_no
Order by D.dept_name, E.emp_no;
-- = 331603 rows affected

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
Select E.first_name "first name", E.last_name "last name", E.sex 
From "Employees" as E
Where (E.first_name in('Hercules') and E.last_name like 'B%')
Order by E.last_name;
-- === Answer 20 rows affectd ===

-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.
Select E.emp_no "employee number", E.last_name "last name", E.first_name "first name", 
	   D.dept_name "department name"
From "Employees" as E
Join dept_emp as DE
On E.emp_no = DE.emp_no
Join departments D
On DE.dept_no = D.dept_no
Where D.dept_name = 'Sales'
Order by D.dept_name, E.emp_no;
-- = 52245 rows affected

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
Select E.emp_no "employee number", E.last_name "last name", E.first_name "first name", 
	   D.dept_name "department name"
From "Employees" as E
Join dept_emp as DE
On E.emp_no = DE.emp_no
Join departments D
On DE.dept_no = D.dept_no
Where D.dept_name in ('Sales','Development')
Order by D.dept_name, E.emp_no;
-- = 137.952 rows affected

-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
Select DISTINCT(last_name), Count(*) AS "Total Share last name"
From "Employees"
Group by last_name
Order by "Total Share last name" Desc;
-- 1638 rows affected / Baba 226

