-- Retirement tables created
SELECT
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    ti.title,
    ti.from_date,
    ti.to_date INTO retirement_titles
FROM
    employees AS emp
    INNER JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE
    emp.birth_date BETWEEN '1952-01-01'
    AND '1955-12-31'
ORDER BY
    emp_no ASC;

-- Unique tables created
SELECT
    DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title INTO unique_titles
FROM
    retirement_titles
WHERE
    to_date = '9999-01-01';

-- Retiring tables created
SELECT
    COUNT(emp_no),
    title INTO retiring_titles
FROM
    unique_titles
GROUP BY
    title
ORDER BY
    count DESC;

--  Mentorship table is created
SELECT
    DISTINCT ON (emp.emp_no) emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.birth_date,
    de.from_date,
    de.to_date,
    ti.title INTO mentorship_eligibility
FROM
    employees AS emp
    INNER JOIN dept_emp AS de ON emp.emp_no = de.emp_no
    INNER JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE
    ti.to_date = '9999-01-01'
    AND (
        emp.birth_date BETWEEN '1965-01-01'
        AND '1965-12-31'
    )
ORDER BY
    emp_no ASC;

SELECT
    title,
    COUNT(title)
FROM
    unique_titles
GROUP BY
    title;

SELECT
    dept_name,
    COUNT(dept_name) INTO total_employees_by_dept
FROM
    employees_by_dept
GROUP BY
    dept_name;

SELECT
    COUNT(dept_name)
FROM
    employees_by_dept;

SELECT
    COUNT(emp_no)
FROM
    unique_titles;

SELECT
    title,
    COUNT(title) INTO mentorship_by_title
FROM
    mentorship_eligibility
GROUP BY
    title;