--CHALLENGE 1
select a.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME",title,pub_name as "PUBLISHER"
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join publishers
on titles.pub_id = publishers.pub_id


--CHALLENGE 2
select a.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME",pub_name as "PUBLISHER", count(titleauthor.title_id) as "TITLE COUNT"
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join publishers
on titles.pub_id = publishers.pub_id
group by a.au_id, pub_name
ORDER BY count(titleauthor.title_id) DESC


--CHALLENGE 3
select a.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME", sum(sales.qty) as TITLE_COUNT
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on sales.title_id = titles.title_id
group by a.au_id
order by countsum(sales.qty) desc
limit 3


--CHALLENGE 4
select * from
(select a.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME", sum(sales.qty) as TITLE_COUNT
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on sales.title_id = titles.title_id
group by a.au_id
order by sum(sales.qty) desc) tabla 
where TITLE_COUNT is not null