CREATE VIEW titleview
AS
SELECT title, au_ord, au_lname, price, ytd_sales, pub_id
FROM authors AS a
JOIN titleauthor AS ta ON (a.au_id = ta.au_id)
JOIN titles AS t ON (t.title_id = ta.title_id) 

SELECT * FROM titleview 