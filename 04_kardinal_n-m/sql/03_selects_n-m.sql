-- 03. SELECTS / Servants, Products

-- Einzeltabellen
SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT 
	* 
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Sandro/Peter gekauft?
SELECT 
	#servant_name AS Diener,
    #product_name AS "Von Sandro gekaufte Produkte:"
	CONCAT(servant_name, " kauft ", product_name) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
#WHERE servant_name = "Sandro"
WHERE servant_name = "Peter"
;

-- Wieviele Produkte hat Sandro gekauft?
SELECT 
    CONCAT(
			servant_name, 
            " kauft ", 
            COUNT(product_name),
            " Produkte."
            ) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Sandro"
;

-- Wieviel Geld hat Sandro ausgegeben?
SELECT 
    servant_name AS Diener, -- organisch
    COUNT(servant_name) AS Artikelanzahl, -- aggregiert / f()
    SUM(product_price) AS Gesamtkosten -- aggregiert / f()
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY servant_name
HAVING servant_name = "Sandro"
;

-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE
SELECT 
	servant_name AS Diener,
    product_name AS "Irgendwas mit Sauce oder Lachs"
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%"
#WHERE product_name LIKE "%Huhn%"
;

-- Wie oft wurde das Produkt X gekauft?
SELECT 
	product_name AS Produkte, -- nicht aggr.
    COUNT(product_name) AS Anzahl -- aggr.
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
#ORDER BY count(product_name) DESC
ORDER BY Anzahl DESC  -- Alias 
;

-- Welche Umsätze hatte das Produkt X?
SELECT
	product_name AS Produkte, -- nicht aggr.
    COUNT(product_name) AS Anzahl, -- aggr.
    SUM(product_price) AS Umsätze -- aggr.  // count() * price
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
#ORDER BY sum(product_price) DESC
ORDER BY Umsätze DESC -- Alias
;