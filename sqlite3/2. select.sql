-- Movie.objects.all()
SELECT * FROM movies_movie;  -- SELECT *  : 테이블의 모든 열 선택

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('year')
SELECT * FROM movies_movie 
ORDER BY year;                          --year 기준 정렬 (오름차순)

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie 
ORDER BY year DESC;                    -- DESC :역순 정렬 

-- User.objects.filter(age=31)
SELECT * FROM movies_user
WHERE age=31;

-- User.objects.filter(age__lt20) # 함수이므로 <, > 사용 x >> lt : less then 
SELECT * FROM movies_user
WHERE age<20;

-- 나이가 20대인 사람 (20살 이상, 30살 미만)
-- User.objects.filter(age__gte=20, age__lt=30)        # __gte : 이상

SELECT * FROM movies_user
WHERE age >= 20 AND age < 30;

-- 2000년 미만, 2010년 이후 나온 영화 찾기
-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
SELECT * FROM movies_movie
WHERE year < 2000 OR year > 2010;



-- Movie.objects.aggregate(Max('year'))
SELECT title, MAX(year) FROM movies_movie;  -- year인 컬럼만 뽑기 / 최신작 : MAX (연도의 숫자가 클수록)

-- Movie.objects.aggregate(Min('year'))
SELECT title, MIN(year) FROM movies_movie; 

-- 관객의 평균 나이 구하기
-- User.objects.aggregate(Avg('year'))
SELECT AVG(year) FROM movies_user;

-- ## 1번 영화의 평균 평점 
-- Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))
    -- 1번 영화에 있는 평점, 최대 평점 가져오기 >> 점수의 평균
SELECT MAX(value), AVG(value) FROM movies_score
    -- 1번 영화만 불러오기
WHERE movie_id=1;

-- ## 1번 유저가 작성한 영화 리뷰 갯수 
-- len(Score.objects.filter(user_id=1))
-- Score.objects.filter(user_id=1).count()
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;


-- Movie.objects.filter(title__contains='the')  # the가 포함된 영화 검색
SELECT * FROM movies_movie
WHERE title LIKE '%the%';  

-- Movie.objects.filter(title__startswith='the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%';  -- 앞글자가 the인 영화 검색

-- Movie.objects.filter(title__startswith='on.')
SELECT * FROM movies_movie
WHERE title LIKE '%on.';  -- on.으로 끝나는 영화 검색

-- orm에서 사용하려면 정규 표현식을 사용해야 함.
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%'; --g로 시작하면서 d로 끝나는 4글자 영화 검색

-- ## 중복 제거 : DISTINCT 기준 
-- User.objects.values('country').distinct().count()
SELECT COUNT(DISTINCT country) FROM movies_user;

-- ## 
-- User.objects.filter(age__range=[20,29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- ## Movie.objects.filter(year__in=[2000,2005,2010])
SELECT * FROM movies_movie
WHERE year IN (2000, 2005, 2010);