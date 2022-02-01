#challenge 1
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",tl.title AS "TITLE" ,pb.pub_name AS "PUBLISHER"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id
		WHERE tl.title IS NOT NULL;
# Challenge 2
SELECT title, a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME",
count(t.title_id) AS TITLE_COUNT
	FROM titleauthor AS t
	LEFT JOIN  authors AS a ON a.au_id=t.au_id
	LEFT JOIN titles AS ti ON ti.title_id=t.title_id
	LEFT JOIN publishers AS pu ON pu.pub_id=ti.pub_id
		GROUP BY title
#Challenge 3
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", 
ifnull(sum(sa.qty),0) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
		GROUP BY a.au_id
		ORDER BY TOTAL DESC
            LIMIT 3
         ;
#Challenge 4
SELECT a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", 
ifnull(sum(sa.qty),0) AS 'TOTAL'
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
		GROUP BY a.au_id
		ORDER BY TOTAL DESC
         ;
 
 
    