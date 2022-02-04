SELECT
    COUNT(song_id) quantidade_musicas_no_historico
FROM history t1
INNER JOIN users t2
ON t2.id = t1.user_id AND t2.name = "Bill"
GROUP BY user_id;