-- #1. 데이터의 모든 열 가져오기 : SELECT * 
SELECT * FROM movies_movie;  --Movie.objects.all()
SELECT * FROM movies_user;   --User.objects.all()


-- #2. 데이터 정렬 : 오름차순 ORDER BY 기준; / 역순 ORDER BY 기준 DESC;
SELECT * FROM movies_actor -- Actor.objects.all().order_by('age')
ORDER BY age DESC;

SELECT * FROM movies_category --Category.objects.all().order_by('name')
ORDER BY name;


--#3. 데이터 필터링 / 비교 
-- orm : 미만 : age__lt / 이상 : age__gte /  
SELECT * FROM movies_user  -- User.objects.filter(age__lt=35).order_by('age')
WHERE age<35
ORDER BY age;

-- AND
SELECT * FROM movies_user  -- User.objects.filter(age__lt=35, age__gte=15)
WHERE age<=35 AND age>15   
ORDER BY age;

-- OR
SELECT * FROM movies_movie  -- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
WHERE year < 2000 OR year > 2010;


--#4. 최대, 최소, 평균, 갯수 집계 
-- orm : aggregate
SELECT title, MAX(year) FROM movies_movie; -- Movie.objects.aggregate(Max('year')) : 영화 최신작
SELECT title, MIN(year) FROM movies_movie; -- Movie.objects.aggregate(Min('year')) : 오래된 영화
SELECT AVG(age) FROM movies_user; -- User.objects.aggregate(Avg('year')) : 관객 나이 평균

-- -- ## 1번 영화의 평균 평점 및 최대 점수  
SELECT AVG(value), MAX(value) FROM movies_score  -- Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value')) 
WHERE movie_id=1;

-- -- ## 1번 유저가 작성한 영화 리뷰 갯수 :17
SELECT COUNT(*) FROM movies_score       -- len(Score.objects.filter(user_id=1))
WHERE user_id=1;                        -- Score.objects.filter(user_id=1).count()


--#5. 검색 LIKE '%기준%'
-- -- ## 포함 : %0% 0이 포함된 경우 모두 출력 
SELECT * FROM movies_movie
WHERE year LIKE '%0%'           -- '%0' :0으로 끝나는 / '0%' : 0으로 시작하는

-- Movie.objects.filter(year__contains='0') 
-- Movie.objects.filter(year__startswith='0')
-- Movie.objects.filter(year__startswith='0')

-- -- ## 시작단어, 끝단어 지정해서 검색
SELECT * FROM movies_movie
WHERE title LIKE '%t__e%'; --g로 시작하면서 d로 끝나는 4글자 영화 검색 -> orm에서는 정규 표현식 사용해야 함.


--#6. 중복 제거 : DISTINCT 기준 
SELECT COUNT(DISTINCT country) FROM movies_user;   -- User.objects.values('country').distinct().count()
SELECT COUNT(DISTINCT name) FROM auth_permission;  -- Permission.objects.values("name").distinct().count()



--#7. BETWEEN / IN
SELECT * FROM movies_user                -- User.objects.filter(age__range=[20,29])
WHERE age BETWEEN 20 AND 29;

SELECT * FROM movies_movie               -- Movie.objects.filter(year__in=[2000,2005,2010])
WHERE year IN (2000, 2005, 2010);