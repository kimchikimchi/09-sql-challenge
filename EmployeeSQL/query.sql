-- 1.List the following details of each employee: employee number, last name,
-- first name, sex, and salary.

select e.emp_id, last_name, first_name, sex, amount as salary
  from employee e
  join salary s
    on e.emp_id = s.emp_id;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- See https://www.postgresql.org/docs/9.1/functions-formatting.html for date-to-string conversion
select first_name, last_name, hire_date
  from employee
 where to_char(hire_date, 'YYYY') = '1996';
 
-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select d.dept_id, dept_name, e.emp_id, last_name, first_name
  from department d
  join dept_manager dm
    on d.dept_id = dm.dept_id
  join employee e
    on dm.emp_id = e.emp_id;
	
-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select e.emp_id, last_name, first_name, d.dept_name
  from employee e
  join dept_emp de
    on de.emp_id = e.emp_id 
  join department d
    on d.dept_id = de.dept_id;

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
  from employee
 where first_name = 'Hercules'
   and last_name like 'B%';


-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.
select e.emp_id, last_name, first_name, dept_name
  from employee e
  join dept_emp de
    on de.emp_id = e.emp_id 
  join department d
    on d.dept_id = de.dept_id
 where dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select e.emp_id, last_name, first_name, dept_name
  from employee e
  join dept_emp de
    on de.emp_id = e.emp_id 
  join department d
    on d.dept_id = de.dept_id
 where dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name) as frequency
  from employee
group by last_name
order by frequency desc;
