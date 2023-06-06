-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(255)
);

-- Import data from departments.csv
COPY departments FROM 'departments.csv' DELIMITER ',' CSV HEADER;

-- Create dept_emp table
CREATE TABLE dept_emp (
  emp_no INTEGER,
  dept_no VARCHAR(10),
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Import data from dept_emp.csv
COPY dept_emp FROM 'dept_emp.csv' DELIMITER ',' CSV HEADER;

-- Create dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(10),
  emp_no INTEGER,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Import data from dept_manager.csv
COPY dept_manager FROM 'dept_manager.csv' DELIMITER ',' CSV HEADER;

-- Create employees table
CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY,
  emp_title_id VARCHAR(10),
  birth_date DATE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  sex CHAR(1),
  hire_date DATE
);

-- Import data from employees.csv
COPY employees FROM 'employees.csv' DELIMITER ',' CSV HEADER;

-- Create salaries table
CREATE TABLE salaries (
  emp_no INTEGER PRIMARY KEY,
  salary INTEGER,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Import data from salaries.csv
COPY salaries FROM 'salaries.csv' DELIMITER ',' CSV HEADER;

-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(255)
);

-- Import data from titles.csv
COPY titles FROM 'titles.csv' DELIMITER ',' CSV HEADER;
