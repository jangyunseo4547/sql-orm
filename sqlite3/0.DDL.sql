-- vsCode의 sqlite 확장 설치 
-- Use Database => Run Query

CREATE TABLE test (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER
);

-- table 이름 변경
ALTER TABLE test RENAME TO user;

-- 컬럼 추가 
ALTER TABLE user ADD COLUMN email TEXT;

-- 컬럼 이름 수정
ALTER TABLE user RENAME COLUMN name TO username;

-- 테이블 삭제
DROP TABLE user;