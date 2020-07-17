--Import each CSV file
create table department(dept_no varchar(30), dept_name varchar(30));
select * from department;

create table dept_emp(emp_no int, dept_no varchar(30));
select * from dept_emp;

create table dept_manager(dept_no varchar(30), emp_no int);
select * from dept_manager;

create table employees(emp_no int,
					   emp_title_id varchar(30),
					   birth_date varchar(30),
					   first_name varchar(30),
					   last_name varchar(30),
					   sex varchar(30),
					   hire_date varchar(30));
select * from employees;

create table salaries(emp_no int,salary int);
select * from salaries;

create table titles(title_id varchar(30),title varchar(30));
select * from titles;

--Data analysis
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
	--1A
select X.emp_no, first_name, last_name, sex, salary from employees as X
INNER join salaries on salaries.emp_no = X.emp_no;
	--1B
select Y.emp_no, salary, first_name, last_name, sex from salaries as Y
inner join employees on employees.emp_no = Y.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
alter table employees add hire_year varchar(30);

update employees set hire_year = right(hire_date,4);

select first_name, last_name, hire_date from employees
where hire_year = '1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select * from dept_emp;
select * from dept_manager;

select X.dept_no, dept_name, dept_manager.emp_no, first_name, last_name from department as X
inner join dept_manager on X.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_name, dept_emp.emp_no, first_name, last_name from department
inner join dept_emp on dept_emp.dept_no = department.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from department;

select dept_name, dept_emp.emp_no, last_name, first_name from department
inner join dept_emp on dept_emp.dept_no = department.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_name, dept_emp.emp_no, last_name, first_name from department
inner join dept_emp on dept_emp.dept_no = department.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where dept_name = 'Sales' or dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as last_name_count from employees
group by last_name
order by last_name_count desc;

