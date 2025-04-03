## SQL <---> NOSQL
- 관계형 데이터 베이스 (RDBES) : 표로 저장한 형태, 
    - oracle, 
    - mongodb DB
    - Redis : 임시저장
- database model : relational
- db model 바꾸기 : settings.py >> DATABASES의 name 바꾸기
- python manage.py createtable >> 모델의 테이블 생성

- 비관계형 데이터 베이스 : 표가 아닌 형태

## 파이썬 -----SQL
ORM 직접 작성 <----> SQL 

## SQL 다운로드, 기본 문법 
- 다운로드 : MySQL Community (GPL) Downloads
    - MySQL Community Server>> 8.8.4 버전, window >> C++ X64 설치 >> 비번 설정 
    - MySQL Workbench >> 8.8.4 버전, window 

- `MySQL`
    - 키워드 작성 시 대문자로 작성 권장
    - 번개 표시 : 전체 실행 / 번개표시 1 : 1문장만 실행 -> create new schema (mydb) >> 우클릭 후 refresh all 

## 기본 설정 
- 가상환경 생성 , 활성화
- `pip install django faker` : 장고, faker 같이 설치
- project : sql_orm / app : movies >> `settings.py` app 등록
- `models.py` : 관계 설정 >> makemigrations, migrate (squlite3 생성)
>> sql문 입력 `python manage.py sqlmigrate movies 0001` 
>> `settings.py` DATABASES mysql로 설정 : HOSE, PORT, USER, PASSWORD 추가 설정 
>> `pip install mysqlclient` : migrate 위해 따로 설치 >> migrate만 (mysql 데이터 베이스 서버 연결) 

## 폴더 생성 
- app (movies)>> management 폴더 생성 >> management 폴더 내 `commands`, `__init__.py` 파일 생성 >>> 파일 내 `generate.py`, `__init__.py` 파일 생성
- `python manage.py generate`로 코드 실행

### splite3 >> `1. insert.sql` >> movies 정보 코드 >>바깥 쪽 db.sqlite3 선택

- **ex/ movies_movie에 원하는 컬럼 추가** 
```
INSERT INTO movies_movie (title, year)
VALUES ('dark night', 2008);
```

### `1. insert.sql` orm (terminal) 
`pip install django-extensions` : shell_plus 기능 활용 목적
`pip install ipython` : shell_plus 기능 강화 목적
`python manage.py shell_plus`
`exit()` : shell_plus 나가기 

```
# 1. 
movie = Movie()
>>> movie.title = 'spider man'
>>> movie.year = 2010
>>> movie.save()

# 2. 
Movie.objects.create(title='dark night', year=2008)
```

###  splite3 >> `2.select.sql`
- lookup filter 활용 
    - (title__contains='the') >> insta에 활용 

```python
def serch(request):
    query = request.GET.get('query')
    posts = Post.objects.filter(title__contains=query) 

    context = {
        'posts':posts,
    }
    return render (request, 'serch.html', context)
```

- -- Movie.objects.filter(title__`startswith`='the') : 단어가 포함하는지
- -- Movie.objects.filter(title__`istartswith`='the') : 단어로 시작하는지
-  `%the%` : the 앞과 뒤에 어떤 단어가 들어있어도 됨. the가 들어있는 단어
    - 가* : 가로 시작하는 단어 검색
    - 가?? : 가로 시작하는 세글자 단어 검색

- orm에서는 `정규 표현식` 사용 : 이메일, 전화번호 정규화 시





