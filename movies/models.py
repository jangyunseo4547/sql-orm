from django.db import models

# Create your models here.

class Actor(models.Model):      
    name = models.CharField(max_length=500)
    age = models.IntegerField()
    # movie_set --> movies로 바뀜

class Movie(models.Model): 
    title = models.CharField(max_length=500)
    year = models.IntegerField()
    actors = models.ManyToManyField(Actor, related_name='movies')   # 영화와 영화배우를 M:N으로 연결 (한명의 배우가 여러 영화에 출연)
    # category_set --> categories로 바뀜

class Category(models.Model):
    name = models.CharField(max_length=500)
    movies = models.ManyToManyField(Movie, related_name='categories') # 영화와 장르를 M:N으로 연결(하나의 영화가 다양한 장르를 담을 수 있음)

class User(models.Model):
    name = models.CharField(max_length=500)
    country = models.CharField(max_length=500)
    email = models.CharField(max_length=500)
    age = models.IntegerField()
    # score_set

class Score(models.Model):                                     # 영화, 유저와 점수는 1:n으로 연결
    content = models.CharField(max_length=500)
    value = models.IntegerField()
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
