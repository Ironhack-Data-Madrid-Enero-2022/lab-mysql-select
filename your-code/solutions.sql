-- Ejercicio 1 

select authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name,  
ifnull( titles.title,'DKn')as Title, 
ifnull(publishers.pub_name,'DKn') as Publisher
from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id

-- Ejercico 2 (No funciona por supuesto fallo servidor MYSQL)

SELECT 
    authors.au_id AS Author_ID,
    authors.au_lname AS Last_Name,
    authors.au_fname AS First_Name,
    IFNULL(titles.title, 'DKn') AS Title,
    IFNULL(publishers.pub_name, 'DKn') AS Publisher
    count(titles.title) as TitleCount
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY Title


-- Ejercicio 3 

select a.au_id as AUTHOR_ID,a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME,sum(sa.qty) as TOTAL
from titleauthor as t
left join authors as a
on a.au_id=t.au_id
left join titles as ti
on ti.title_id=t.title_id
left join publishers as pu
on pu.pub_id=ti.pub_id
left join sales as sa
on sa.title_id=ti.title_id
group by a.au_id
order by TOTAL DESC 
limit 3

-- Ejercio 4 

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










