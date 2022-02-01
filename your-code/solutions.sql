-- CHALLENGE 1
create temporary table Publications_lab.Author_publisher
select ta.au_id as AUTHOR, 
	au_lname as LASTNAME, 
    au_fname as FIRSTNAME, 
    title as TITLE, 
    pub_name as PUBLISHER
	from authors
		left join titleauthor as ta
			on ta.au_id= authors.au_id
		left join titles as ti
			on ti.title_id = ta.title_id
		left join publishers as pu
			on pu.pub_id = ti.pub_id
WHERE ta.au_id is not NULL;

-- CHALLENGE 2
select ta.au_id as AUTHOR, 
	au_lname as LASTNAME, 
    au_fname as FIRSTNAME, 
    title as TITLE, 
    pub_name as PUBLISHER,
    count(*) as COUNT
	from authors
		left join titleauthor as ta
			on ta.au_id= authors.au_id
		left join titles as ti
			on ti.title_id = ta.title_id
		left join publishers as pu
			on pu.pub_id = ti.pub_id
WHERE ta.au_id is not NULL
group by author;


-- CHALLENGE 3
select ta.au_id as AUTHOR, 
	au_lname as LASTNAME, 
    au_fname as FIRSTNAME,
    sum(qty) as TOTAL
	from authors
		inner join titleauthor as ta
			on ta.au_id= authors.au_id
		inner join sales as sa
			on sa.title_id = ta.title_id
WHERE ta.au_id is not NULL
group by author
order by total desc
limit 3;

-- CHALLENGE 4 
select ta.au_id as AUTHOR, 
	au_lname as LASTNAME, 
    au_fname as FIRSTNAME,
    ifnull(sum(qty),0) as TOTAL
	from authors
		left join titleauthor as ta
			on ta.au_id= authors.au_id
		left join sales as sa
			on sa.title_id = ta.title_id
WHERE ta.au_id is not NULL
group by author
order by total desc
limit 23;
