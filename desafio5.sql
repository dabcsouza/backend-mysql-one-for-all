SELECT 
	t2.name cancao,
	COUNT(reproduce_date) reproducoes
FROM SpotifyClone.history t1
INNER JOIN songs t2
ON t1.song_id = t2.id
GROUP BY song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;