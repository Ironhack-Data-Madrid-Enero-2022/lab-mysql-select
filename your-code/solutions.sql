-- CHALLENGE 1

select authors.au_id as 'AUTHOR_ID',
authors.au_lname as 'LAST_NAME',
authors.au_fname as 'FIRST_NAME',
titles.title as 'TITLE',
publishers.pub_name as 'PUBLISHER'



from authors 


left join titleauthor on titleauthor.au_id =  authors.au_id

left join titles on titleauthor.title_id =  titles.title_id

left join publishers on titles.pub_id = publishers.pub_id 

-- CHALLENGE 2 

select  authors.au_id as 'AUTHOR_ID',
authors.au_lname as 'LAST_NAME',
authors.au_fname as 'FIRST_NAME',
publishers.pub_name as 'PUBLISHER',
count(titles.title) as 'TITLE COUNT'


from authors 


left join titleauthor on titleauthor.au_id =  authors.au_id

left join titles on titleauthor.title_id =  titles.title_id

left join publishers on titles.pub_id = publishers.pub_id

group by TITLE

-- CHALLENGE 3


select authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME,
sum(sales.qty) as TOTAL

from titleauthor 

left join authors on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
left join sales on sales.title_id = titles.title_id

group by title
order by TOTAL DESC 
limit 3

-- CHALLENGE 4

select authors.au_id as AUTHOR_ID,
authors.au_lname as LAST_NAME, 
authors.au_fname as FIRST_NAME,
coalesce(sum(sales.qty),0) as TOTAL

from titleauthor 

left join authors on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
left join sales on sales.title_id = titles.title_id

group by title

order by TOTAL DESC 






