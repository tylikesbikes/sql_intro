--1
select * from analytics where id=1880;

--2
select id, app_name from analytics where last_updated = '08-01-2018';

--3
select category, count(id) as app_count from analytics group by category;

--4
select app_name, reviews from analytics order by reviews desc limit 5;

--5
select app_name, rating from analytics where rating>=4.8 order by reviews desc limit 1;

--6
select category, avg(rating) as avg_rating from analytics group by category order by avg(rating) desc;

--7
select app_name, price, rating from analytics where rating < 3 order by price desc limit 1;

--8
select app_name, rating from analytics where min_installs <= 50 and rating is not null order by rating desc;

--9
select app_name from analytics where rating <3 and reviews >= 10000;

--10
select app_name, reviews, price from analytics where price between 0.1 and 1.00 order by reviews desc limit 10;

--11
select app_name, last_updated from analytics order by last_updated asc limit 1;

--12
select app_name, price from analytics order by price desc limit 1;

--13
select sum(reviews) as review_ct from analytics;

--14
select category, count(id) as app_count from analytics group by category having count(id)>=300;

--15
select 
    app_name,
    reviews,
    min_installs,
    min_installs/reviews as inst_rev_proportion
from analytics
    where min_installs >= 100000
group by app_name, reviews, min_installs
order by min_installs/reviews desc 
limit 1;

--FS1
select sq.app_name, sq.category, sq.rating from (
select app_name, category, rating, row_number() over (partition by category order by rating desc) as rownum from analytics where min_installs >= 50000 and rating is not null
order by rating desc) sq where sq.rownum=1;

--FS2
select app_name from analytics where lower(app_name) like '%facebook%';

--FS3
select id, app_name, array_length(genres,1) as genre_ct from analytics where array_length(genres,1) > 1 group by id, app_name;

--FS4
select id, app_name, 'Education' = ANY(genres) as EduApp from analytics where 'Education' = ANY(genres) = true;