SELECT
    t2.name nome,
    COUNT(t1.user_id) reproducoes
FROM history t1
INNER JOIN songs t2
ON t2.id = t1.song_id
INNER JOIN users t3
ON t3.id = t1.user_id AND t3.plan_id IN (1,3) 
GROUP BY t2.id
ORDER BY nome;