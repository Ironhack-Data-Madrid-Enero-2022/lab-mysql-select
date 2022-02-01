-- CHALLENGE 1

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', p.pub_name as 'PUBLISHER'
from authors
left join titleauthor as t 
on authors.au_id = t.au_id
left join titles
on t.title_id = titles.title_id
left join publishers as p
on titles.pub_id = p.pub_id;

-- CHALLENGE 2

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', p.pub_name as 'PUBLISHER', 
count(titles.title_id) as TITLE_COUNT
from authors
left join titleauthor as t 
on authors.au_id = t.au_id
left join titles
on t.title_id = titles.title_id
left join publishers as p
on titles.pub_id = p.pub_id
GROUP BY (title);

-- CHALLENGE 3
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
sum(sales.qty) as TOTAL
from authors
left join titleauthor as t 
on authors.au_id = t.au_id
left join titles
on t.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by(title) order by TOTAL desc
LIMIT 3;

-- CHALLENGE 4
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
ifnull(sum(sales.qty),0) as TOTAL
from authors
left join titleauthor as t 
on authors.au_id = t.au_id
left join titles
on t.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by(title) order by TOTAL desc
limit 23;