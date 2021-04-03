-- Delete order depends on foregin key dependencies
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS department;

-- Table Creation
-- Also note dependant tables need to be created first
-- before creating tables references PKs in those dependant tables. 
CREATE TABLE "title" (
    "title_id" int   NOT NULL PRIMARY KEY,
    "name" varchar   NOT NULL
);

CREATE TABLE "department" (
    "dept_id" varchar   NOT NULL PRIMARY KEY,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "employee" (
    "emp_id" int   NOT NULL PRIMARY KEY,
    "title_id" int   NOT NULL,
    "birthday_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" varchar   NOT NULL,
    FOREIGN KEY (title_id) REFERENCES title(title_id)
);

CREATE TABLE "salary" (
    "amount" int   NOT NULL,
    "emp_id" int   NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE "dept_emp" (
    "emp_id" int   NOT NULL,
    "dept_id" varchar   NOT NULL,
    PRIMARY KEY (emp_id, dept_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
 );

CREATE TABLE "dept_manager" (
    "dept_id" varchar   NOT NULL,
    "emp_id" int   NOT NULL,
    PRIMARY KEY (dept_id, emp_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

