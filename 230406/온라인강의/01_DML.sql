-- users table 생성
CREATE TABLE users (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);

-- 테이블명 바꾸기
ALTER TABLE contacts RENAME TO new_contacts;

-- COUNT(*) : NULL 카운트 O / COUNT('name') : NULL 카운트 X
SELECT COUNT(*) FROM users;

-- 평균값
SELECT AVG(balance) FROM users;

SELECT DISTINCT country FROM users;

SELECT country, AVG(balance) FROM users WHERE country='전라북도';

SELECT country, AVG(balance) FROM users GROUP BY country ORDER BY AVG(balance) DESC;

SELECT AVG(age) FROM users WHERE age >= 30;

SELECT country, COUNT(*) FROM users GROUP BY country ORDER BY COUNT(*);

SELECT last_name, COUNT(*) FROM users GROUP BY last_name ORDER BY COUNT(*) DESC;

-- 조회할때만 number~ 로 보이는 것 / 실제 테이블은 COUNT(*)임
SELECT last_name, COUNT(*) AS number_of_last_name FROM users GROUP BY last_name ORDER BY COUNT(*) DESC;



----- CRUD -----
CREATE TABLE classmates (
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO classmates (name, age, address) VALUES ('홍길동', 23, '서울');
-- 생략하면 컬럼 순서대로 하나씩 들어감 + 여러개 동시 삽입 가능
INSERT INTO classmates
VALUES
    ('김철수', 30, '경기'),
    ('이영미', 31, '강원'),
    ('박진성', 26, '전라'),
    ('최지수', 12, '충청'),
    ('정요한', 28, '경상');

UPDATE classmates
SET name='김철수한무두루미',
    address='제주도'
WHERE rowid=2;

DELETE FROM classmates
WHERE rowid=5;

DELETE FROM classmates
WHERE name LIKE '%영%';

DELETE FROM classmates;