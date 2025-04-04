-- ## 1. movie = Movie.objects.get(id=1)
-- movie.title = 'spider man'
-- movie.save()

SELECT * FROM movies_movie
WHERE id=1;

--#1. UPDATE 모델 SET 수정사항 WHERE
UPDATE movies_movie
SET title='iron man'
WHERE id=1;