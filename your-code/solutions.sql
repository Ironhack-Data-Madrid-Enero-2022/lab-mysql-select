
----Query 1----


select a.au_id as AUTHOR_ID, 
au_lname as LAST_NAME, 
au_fname as FIRST_NAME, 
title as TITLE, 
pub_name as PUBLISHERS
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id

------Query 2-----

select a.au_id as AUTHOR_ID, 
au_lname as LAST_NAME, 
au_fname as FIRST_NAME, 
pub_name as PUBLISHERS,
count(title) AS TITLE_COUNT
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
GROUP BY a.au_id;

-----QUERY 3----

select a.au_id as AUTHOR_ID, 
au_lname as LAST_NAME, 
au_fname as FIRST_NAME, 
title as TITLE,
count(title) AS TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by a.au_id
order by TOTAL desc
limit 3;

----QUERY 4----

select a.au_id as AUTHOR_ID, 
au_lname as LAST_NAME, 
au_fname as FIRST_NAME, 
title as TITLE,
ifnull(count(title), 0) AS TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
group by a.au_id
order by TOTAL desc;