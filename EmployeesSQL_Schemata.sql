employees

emp_no PK int
emp_title_id VARCHAR(5)
birth_date DATE
first_name VARCHAR(200)
last_name VARCHAR(200)
sex VARCHAR(1)
hire_date DATE

departments as d

dept_no VARCHAR(4) PK 
dept_name VARCHAR

dept_emp as de

emp_no int PK FK >- employees.emp_no
dept_no VARCHAR(4) FK >- d.dept_no

dept_manager as dm 

dept_no PK VARCHAR(4) FK >- d.dept_no
emp_no int FK >- employees.emp_no

salaries as sal

emp_no int PK FK >- employees.emp_no
salary money

titles as tit

title_id VARCHAR(5) PK FK >- employees.emp_title_id
title VARCHAR






