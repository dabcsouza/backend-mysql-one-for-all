SELECT 
	t3.name usuario, COUNT(t2.name) qtde_musicas_ouvidas,
    ROUND(SUM(`duration(secounds)`) / 60, 2) total_minutos
FROM SpotifyClone.history t1
INNER JOIN songs t2
ON t1.song_id = t2.id
INNER JOIN users t3
ON t1.user_id = t3.id
GROUP BY t3.name
ORDER BY t3.name;