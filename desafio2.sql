SELECT
	COUNT(DISTINCT(t1.name)) cancoes,
    COUNT(DISTINCT(t2.name)) artistas,
    COUNT(DISTINCT(t3.name)) albuns
FROM songs t1
INNER JOIN
	artist t2
ON 
	t2.id = t1.artist_id
INNER JOIN 
	album t3
ON
	t3.artist_id = t2.id;