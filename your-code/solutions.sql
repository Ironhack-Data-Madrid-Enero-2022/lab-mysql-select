-- CHALLENGE 1:

select authors.au_id as 'AUTHOR ID',
au_lname as 'LAST NAME',
au_fname as 'FIRST NAME',
title as TITLE,
pub_name as PUBLISHER

from titleauthor
 
left join authors
on titleauthor.au_id = authors.au_id

left join titles
on titleauthor.title_id = titles.title_id

left join publishers
on titles.pub_id = publishers.pub_id



--- CHALLENGE 2

select authors.au_id as 'AUTHOR ID',
au_lname as 'LAST NAME',
au_fname as 'FIRST NAME',
publishers.pub_name as 'PUBLISHER',
count(titles.title) as 'TITLE COUNT'

from authors
 
left join titleauthor
on titleauthor.au_id = authors.au_id

left join titles
on titleauthor.title_id = titles.title_id

left join publishers
on titles.pub_id = publishers.pub_id

group by titles.title

order by count(titles.title) desc



--- CHALLENGE 3

select authors.au_id as 'AUTHOR ID',
au_lname as 'LAST NAME',
au_fname as 'FIRST NAME',
sum(sales.qty) as TOTAL

from authors
 
left join titleauthor
on titleauthor.au_id = authors.au_id

left join sales
on titleauthor.title_id = sales.title_id

group by authors.au_id

order by TOTAL desc

limit 3



--- CHALLENGE 4

select authors.au_id as 'AUTHOR ID',
au_lname as 'LAST NAME',
au_fname as 'FIRST NAME',
ifnull(sum(sales.qty), 0) as TOTAL

from authors
 
left join titleauthor
on titleauthor.au_id = authors.au_id

left join sales
on titleauthor.title_id = sales.title_id

group by authors.au_id

order by TOTAL desc