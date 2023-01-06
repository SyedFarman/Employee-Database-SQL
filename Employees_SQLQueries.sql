CREATE TABLE titles(	
	title_id VARCHAR PRIMARY KEY, 
	title VARCHAR,
	FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)	
	);

SELECT *
FROM titles;

CREATE TABLE employees(	
	emp_no VARCHAR PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	sex VARCHAR,
	hire_date VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT *
FROM employees;

CREATE TABLE departments
	(	
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR);

SELECT *
FROM departments;


CREATE TABLE dept_emp
	(	
	emp_no VARCHAR PRIMARY KEY, 
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
	);

SELECT *
FROM dept_emp;

CREATE TABLE dept_manager
	(	
	dept_no VARCHAR(4) PRIMARY KEY, 
	emp_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

SELECT *
FROM dept_manager;

CREATE TABLE salaries
	(	
	emp_no VARCHAR PRIMARY KEY, 
	salary VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

SELECT *
FROM salaries;


--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, first_name,last_name,sex,salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date
LIKE '%1986';


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no,dept_name,dept_manager.emp_no, first_name,last_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no=departments.dept_no
JOIN employees ON employees.emp_no=dept_manager.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,last_name,first_name,departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex
FROM employees
WHERE last_name = "Hercules" and last_name LIKE "B%";


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_emp.emp_no,last_name,first_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,last_name,first_name,departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,count(last_name) AS "frequency counts"
FROM employees
GROUP BY last_name
ORDER BY "frequency counts" DESC
