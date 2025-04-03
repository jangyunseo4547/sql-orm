-- Schema 선택 명령어
USE mydb;

-- table 생성 명령어
CREATE TABLE test (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    age INTEGER
); 

-- table 이름 변경
ALTER TABLE test RENAME TO user;

-- 컬럼 추가 
ALTER TABLE user ADD COLUMN email TEXT;