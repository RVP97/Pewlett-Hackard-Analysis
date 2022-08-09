-- Use Distinct with Orderby to remove duplicate rows
SELECT
    DISTINCT ON (______) _____,
    ______,
    ______,
    ______ INTO nameyourtable
FROM
    _______
WHERE
    _______
ORDER BY
    _____,
    _____ DESC;

copy departments TO '/Users/rodrigo/Desktop/Bootcamp/Week 7 SQL/Pewlett-Hackard-Analysis' WITH DELIMITER ',' CSV HEADER;