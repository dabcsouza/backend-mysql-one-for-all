SELECT 
	t2.name artista,
    t1.name album, 
    COUNT(t1.id) seguidores 
FROM album t1
INNER JOIN artist t2
ON t1.artist_id = t2.id
INNER JOIN following t3
ON t2.id = t3.artist_id
GROUP BY t1.name, t2.name
ORDER BY seguidores DESC, artista, album;