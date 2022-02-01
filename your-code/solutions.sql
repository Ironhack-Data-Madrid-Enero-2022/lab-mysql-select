Challenge 1

SELECT
authors.au_id as Author_ID, 
authors.au_lname as Last_Name, 
authors.au_fname as First_Name,  
ifnull( titles.title,'DKn')as Title, 
ifnull(publishers.pub_name,'DKn') as Publisher

FROM
authors
LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id

Challenge 2

SELECT
authors.au_id as Author_ID, 
authors.au_lname as Last_Name, 
authors.au_fname as First_Name,  
ifnull( titles.title,'DKn')as Title, 
ifnull(publishers.pub_name,'DKn') as Publisher
count(titles.title) as TitleCount

FROM
authors
LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id
Group By Title

Challenge 3

SELECT
authors.au_id as Author_ID, 
authors.au_lname as Last_Name, 
authors.au_fname as First_Name,  
sum(sales.qty) as TOTAL


FROM
authors
LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
group by Author_ID
ORDER BY TOTAL DESC

LIMIT 3

Challenge 4

SELECT
authors.au_id as Author_ID, 
authors.au_lname as Last_Name, 
authors.au_fname as First_Name,  
ifnull(sum(sales.qty), 0) as TOTAL


FROM
authors
LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
group by Author_ID
ORDER BY TOTAL DESC



