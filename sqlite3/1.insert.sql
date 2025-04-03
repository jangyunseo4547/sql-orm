-- ## 1) db.sqlite3 : movies 정보 넣기
-- Movie.objects.create(title ='dark night', year = 2008)

INSERT INTO movies_movie (title, year)
VALUES ('dark night', 2008);

-- ## 2) movies_actor 영화 배우 정보 넣기 
-- Actor.objects.create(name="Robert Joe", age=40)

INSERT INTO movies_actor (name, age)
VALUES ('Robert Joe', 40);