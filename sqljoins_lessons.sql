-- first q
select * from owners o left join vehicles v on o.id = v.owner_id;

-- second q
select o.first_name, o.last_name, count(v.id) from owners o join vehicles v on o.id = v.owner_id
group by o.first_name, o.last_name order by o.first_name asc;

-- third q
select o.first_name, o.last_name, avg(v.price)::int, count(v.id)
from owners o
join vehicles v
on o.id = v.owner_id
group by o.id, o.first_name, o.last_name
having count(v.id) > 1 and avg(v.price)>10000
order by o.first_name desc;