CREATE TABLE users(
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country TEXT NOT NULL,
    phone TEXT NOT NULL UNIQUE,
    balance INTEGER NOT NULL
);

SELECT country, AVG(balance)
FROM users
WHERE country='전라북도';

SELECT country, AVG(balance)
FROM users
GROUP BY country
ORDER BY AVG(balance) DESC;

SELECT AVG(age)
FROM users
WHERE age >= 30;

SELECT country
FROM users
GROUP BY country;

SELECT DISTINCT country
FROM users;

SELECT country, COUNT(*)
FROM users
GROUP BY country
ORDER BY COUNT(*);

SELECT last_name, COUNT(*) AS number_of_last_name
FROM users
GROUP BY last_name
ORDER BY COUNT(*) DESC;

SELECT country, AVG(age)
FROM users
GROUP BY country
ORDER BY AVG(age);

CREATE TABLE classmates(
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO classmates
VALUES
    ('김싸피', 23, '경기2222'),
    ('이름', 11, '지역');

UPDATE classmates
SET name = '김초롱',
    age = '200'
WHERE address='경기2222';

ALTER TABLE classmates RENAME TO friends;

UPDATE friends
SET age = 300,
    address='울산'
WHERE name='박초롱';

DELETE FROM friends
WHERE address='경기2222';