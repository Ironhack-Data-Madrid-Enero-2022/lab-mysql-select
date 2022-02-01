-- CHALLENGE 1
SELECT  authors.au_id as 'Author_ID', au_fname as 'First_name', au_lname as 'Last_name', title as 'Title', pub_name as 'Publisher'
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id
WHERE title is not NULL;

-- CHALLENGE 2
SELECT  authors.au_id as 'Author_ID', au_fname as 'First_name', au_lname as 'Last_name', pub_name as 'Publisher', COUNT(title) as 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id
WHERE title is not NULL
GROUP BY authors.au_id, pub_name;

-- CHALLENGE 3
SELECT  authors.au_id as 'Author_ID', au_fname as 'First_name', au_lname as 'Last_name', IFNULL(SUM(qty),0) as 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id
LEFT JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id 
ORDER BY SUM(qty) DESC
LIMIT 3;

-- CHALLENGE 4
SELECT  authors.au_id as 'Author_ID', au_fname as 'First_name', au_lname as 'Last_name', IFNULL(SUM(qty),0) as 'TOTAL'
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
LEFT JOIN titles ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers ON titles.pub_id=publishers.pub_id
LEFT JOIN sales ON sales.title_id=titles.title_id
GROUP BY authors.au_id 
ORDER BY SUM(qty) DESC