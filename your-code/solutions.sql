
----Query 1----


SELECT a.au_id as author_id, 
au_lname AS last_name, 
au_fname AS first_name, 
title AS title, 
pub_name AS publishers
from authors as a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id;

------Query 2-----

SELECT a.au_id AS author_id, 
au_lname AS last_name, 
au_fname AS first_name, 
pub_name AS publishers,
COUNT(title) AS title_count
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY a.au_id;

-----QUERY 3----

SELECT a.au_id AS author_id, 
au_lname AS last_name, 
au_fname AS first_name, 
title AS title,
COUNT(title) AS total
FROM authors AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY total DESC
LIMIT 3;

----QUERY 4----

SELECT a.au_id AS author_id, 
au_lname AS last_name, 
au_fname AS first_name, 
title as TITLE,
IFNULL(count(title), 0) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN titles AS t
ON ta.title_id = t.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;