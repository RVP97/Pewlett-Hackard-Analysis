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