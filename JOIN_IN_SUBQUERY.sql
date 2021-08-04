USE sakila;

SELECT language.name
FROM language;

SELECT category.name
FROM category;
-- ??what are the constraints of WHERE ??

SELECT film.title, film.description, language.name AS language, cat_title.name AS genre
FROM film 
INNER JOIN language ON film.language_id = language.language_id AND language.name IN ('English','French')
INNER JOIN 
	(SELECT film_category.film_id, category.name, category.category_id 
			FROM film_category 
			INNER JOIN category ON 
			film_category.category_id = category.category_id AND film_category.category_id in ('6','11')) AS cat_title
ON film.film_id = cat_title.film_id 
;

/* failed attempt down below
SELECT film.title, film.description, lang.name, cat.name
FROM film 
INNER JOIN language as lang ON film.language_id = lang.language_id
INNER JOIN (SELECT film_category.film_id, category.name, category.category_id 
			FROM film_category 
			INNER JOIN category ON 
			film_category.category_id = category.category_id) AS cat_title
	ON film.film_id = cat_title.film_id
WHERE lang.name in (french, english) AND cat.name in (horror, documentary)
;
*/
