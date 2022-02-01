-- CHALENGE 1
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",tl.title AS "TITLE" ,pb.pub_name AS "PUBLISHER"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id  
    where tl.title_id is not null

    --CHALENGE 2

    SELECT a.au_id AS "AUTHOR_ID", a.au_lname AS "LAST_NAME", a.au_fname AS "FIRST_NAME", pb.pub_name AS "PUBLISHER", COUNT(*) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id  
    where tl.title_id is not null
    group by tl.title_id

    --CHALENGE 3

SELECT a.au_id AS "AUTHOR_ID", a.au_lname AS "LAST_NAME", a.au_fname AS "FIRST_NAME", pb.pub_name AS "PUBLISHER", 
sum(sa.qty) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
    group by a.au_id
    order by TOTAL desc
    limit 3

    --CHALENGE 4

   
SELECT a.au_id AS "AUTHOR_ID", a.au_lname AS "LAST_NAME", a.au_fname AS "FIRST_NAME", ifnull(pb.pub_name, 0) AS "PUBLISHER", 
ifnull(sum(sa.qty),0) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
    group by a.au_id
    order by TOTAL desc