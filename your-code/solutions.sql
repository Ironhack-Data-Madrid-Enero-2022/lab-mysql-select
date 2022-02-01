--CHALLENGE 1
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,ti.title as TITLE,pu.pub_name as PUBLISHER
from titleauthor as t
left join authors as a
on a.au_id=t.au_id
left join titles as ti
on ti.title_id=t.title_id
left join publishers as pu
on pu.pub_id=ti.pub_id

--CHALLENGE 2
select a.au_id as AUTHOR_ID,a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,pu.pub_name as PUBLISHER,count(t.title_id) as TITLE_COUNT,
count(t.title_id) as TITLE_COUNT
from titleauthor as t
left join authors as a
on a.au_id=t.au_id
left join titles as ti
on ti.title_id=t.title_id
left join publishers as pu
on pu.pub_id=ti.pub_id
group by title

--CHALLENGE 3
select a.au_id as AUTHOR_ID,a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,sum(sa.qty) as TOTAL
from authors as a
left join titleauthor as t
on a.au_id=t.au_id
left join titles as ti
on ti.title_id=t.title_id
left join publishers as pu
on pu.pub_id=ti.pub_id
left join sales as sa
on sa.title_id=ti.title_id
group by a.au_id
order by TOTAL DESC 
LIMIT 3

--CHALLENGE 4
select a.au_id as AUTHOR_ID,a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,ifnull(sum(sa.qty),0) as TOTAL
from authors as a
left join titleauthor as t
on a.au_id=t.au_id
left join titles as ti
on ti.title_id=t.title_id
left join publishers as pu
on pu.pub_id=ti.pub_id
left join sales as sa
on sa.title_id=ti.title_id
group by a.au_id
order by TOTAL DESC 
