SELECT
    *
FROM
    departments;

SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    birth_date BETWEEN '1952-01-01'
    AND '1952-12-31';

SELECT
    COUNT(first_name)
FROM
    employees
WHERE
    (
        birth_date BETWEEN '1952-01-01'
        AND '1955-12-31'
    )
    AND (
        hire_date BETWEEN '1985-01-01'
        AND '1988-12-31'
    );

SELECT
    emp_no,
    first_name,
    last_name INTO retirement_info
FROM
    employees
WHERE
    (
        birth_date BETWEEN '1952-01-01'
        AND '1955-12-31'
    )
    AND (
        hire_date BETWEEN '1985-01-01'
        AND '1988-12-31'
    );

SELECT
    departments.dept_name,
    dept_manager.emp_no,
    dept_manager.from_date,
    dept_manager.to_date
FROM
    departments
    INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no;

SELECT
    retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
    dept_emp.to_date
FROM
    retirement_info
    LEFT JOIN dept_emp ON retirement_info.emp_no = dept_emp.emp_no;

SELECT
    r.emp_no,
    r.first_name,
    r.last_name,
    d.to_date
FROM
    retirement_info AS r
    LEFT JOIN dept_emp AS d ON r.emp_no = d.emp_no;

SELECT
    ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date INTO current_emp
FROM
    retirement_info AS ri
    LEFT JOIN dept_emp AS de ON ri.emp_no = de.emp_no
WHERE
    de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT
    COUNT(ce.emp_no),
    de.dept_no INTO leaving_emp_by_dept
FROM
    current_emp AS ce
    LEFT JOIN dept_emp AS de ON ce.emp_no = de.emp_no
GROUP BY
    de.dept_no
ORDER BY
    dept_no;

-- Employee count by department number and name
SELECT
    lv.count,
    lv.dept_no,
    dp.dept_name
FROM
    leaving_emp_by_dept AS lv
    LEFT JOIN departments AS dp ON lv.dept_no = dp.dept_no;

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    e.gender,
    s.salary,
    de.to_date INTO emp_info
FROM
    employees AS e
    INNER JOIN salaries AS s ON (e.emp_no = s.emp_no)
    INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
WHERE
    (
        e.birth_date BETWEEN '1952-01-01'
        AND '1955-12-31'
    )
    AND (
        e.hire_date BETWEEN '1985-01-01'
        AND '1988-12-31'
    )
    AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    ce.last_name,
    ce.first_name,
    dm.from_date,
    dm.to_date INTO manager_info
FROM
    dept_manager AS dm
    INNER JOIN departments AS d ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce ON (dm.emp_no = ce.emp_no);

-- Only get employee information from the sales department
SELECT
    *
FROM
    dept_info
WHERE
    dept_name = ('Sales');

-- Get employee info from both sales and development
SELECT
    *
FROM
    dept_info
WHERE
    dept_name IN ('Sales', 'Development')