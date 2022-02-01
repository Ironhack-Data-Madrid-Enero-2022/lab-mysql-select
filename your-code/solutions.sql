-- CHALLENGE 1
select 
	titleauthor.au_id as AUTHOR_ID,
	concat(au_lname,",",au_fname) as COMPLETE_NAME,
	titles.title as TITLE,
	pub_name as PUBLISHER  
from titleauthor
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on titles.pub_id=publishers.pub_id
left join authors
on titleauthor.au_id=authors.au_id
-- CHALLENGE 2
-- Corregido error 1055 de SQL!!!!!
select 
	titleauthor.au_id as AUTHOR_ID,
	concat(au_lname,",",au_fname) as COMPLETE_NAME,
	titles.title as TITLE,
	pub_name as PUBLISHER  
from titleauthor
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on titles.pub_id=publishers.pub_id
left join authors
on titleauthor.au_id=authors.au_id
group by titleauthor.au_id;
-- CHALLENGE 3
select 
	titleauthor.au_id as AUTHOR_ID,
	concat(au_lname,",",au_fname) as COMPLETE_NAME,
    sum(sales.qty) as TOTAL
from titleauthor
left join titles
on titles.title_id=titleauthor.title_id
left join authors
on titleauthor.au_id=authors.au_id
left join sales
on titles.title_id=sales.title_id
group by authors.au_id
order by sum(sales.qty) desc
limit 3

--CHALLLENGE 4

select 
	authors.au_id as AUTHOR_ID,
	concat(au_lname,",",au_fname) as COMPLETE_NAME,
    ifnull(sum(sales.qty),0) as TOTAL
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join sales
on titles.title_id=sales.title_id
group by authors.au_id
order by sum(sales.qty) desc
limit 23