-- ___________________________________________________
--
-- Challenge 1 - Who Have Published What At Where?
-- ___________________________________________________
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', pub_name as 'PUBLISHER'
from titles
left join titleauthor on titleauthor.title_id = titles.title_id 
left join authors on authors.au_id = titleauthor.au_id 
inner JOIN publishers on publishers.pub_id = titles.pub_id 
where authors.au_id is not null
;

-- select * from titleauthor
-- ___________________________________________________
--
-- Challange 2 - Who Have Published How Many At Where?
-- ___________________________________________________
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', pub_name as 'PUBLISHER', count(title) as 'TITLE COUNT'
from titles
left join titleauthor on titleauthor.title_id = titles.title_id 
left join authors on authors.au_id = titleauthor.au_id 
inner JOIN publishers on publishers.pub_id = titles.pub_id 
where authors.au_id is not null
group by authors.au_id, publishers.pub_id
;

-- ___________________________________________________
--
-- Challenge 3 - Best Selling Authors
-- ___________________________________________________
select a.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME',  sum(s.qty) as 'TOTAL'
from titles as t
left join titleauthor on titleauthor.title_id = t.title_id 
left join authors as a on a.au_id = titleauthor.au_id 
left join sales as s on s.title_id = t.title_id
group by a.au_id
ORDER BY TOTAL DESC, a.au_fname
limit 3
;

-- ___________________________________________________
--
-- Challenge 4 - Best Selling Authors Ranking
-- ___________________________________________________
SELECT a.au_id AS "AUTHOR_ID", a.au_lname AS "LAST_NAME", a.au_fname AS "FIRST_NAME", ifnull(pb.pub_name,'None') AS "PUBLISHER",
IFNULL(sum(sa.qty),0) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
    group by a.au_id
    order by TOTAL desc
