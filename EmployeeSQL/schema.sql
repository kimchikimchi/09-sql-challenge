-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_id" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_emp" (
    "emp_id" int   NOT NULL,
    "dept_id" int   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_id" int   NOT NULL,
    "emp_id" int   NOT NULL
);

CREATE TABLE "employee" (
    "emp_id" int   NOT NULL,
    "title_id" int   NOT NULL,
    "birthday_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "salary" (
    "amount" int,   NOT NULL,
    "emp_id" int   NOT NULL
);

CREATE TABLE "title" (
    "title_id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("title_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

