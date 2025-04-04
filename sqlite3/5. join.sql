-- ## 1. 1번유저가 작성한 모든 영화 리뷰 보기 
-- movies_user, movies_score 두가지 테이블을 하나로 합침.ABORT

    -- 1.1) User.objects.get(id=1).score_set.all()
    -- 1.2)Score.objects.filter(user_id=1)

--## 1. SELECT / FROM a JOIN b / ON [같은 부분] / HWERE 
SELECT * 
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
WHERE movies_user.id=1;



-- ## 2. 100번 영화가 어떤 카테고리인지 보기
    -- movie = Movie.objects.get(id=100)
    -- movie.categories.all()
    -- movies.movie / movies_category_movies / movies_category 세가지 테이블

SELECT * 
FROM movies_movie JOIN movies_category_movies
ON movies_movie.id = movies_category_movies.movie_id

join movies_category  -- 1
ON movies_category_movies.category_id = movies_category.id
WHERE movies_movie.id=100;

-- #3. drama 카테고리에 속한 모든 영화 출력 
    -- 1) Category.objects.get(name='drama').movies.all()
    -- 2) Category.objects.filter(name='drama')[0]
    -- movies.movie / movies_category_movies / movies_category 세가지 테이블

SELECT * 
FROM movies_category JOIN movies_category_movies
ON movies_category.id = movies_category_movies.category_id

join movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name= 'drama';

-- #4. groupby 
    -- User.objects.values('country').annotate(Count('id'))

SELECT country, COUNT(*) FROM movies_user
GROUP BY country;

-- #4.1
    -- User.objects.values('country').annotate(Avg('score__value'))
SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
GROUP BY country;    -- 나라를 기준으로 그룹 바이


