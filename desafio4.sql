SELECT 
	t3.name usuario,
CASE
	WHEN MAX(YEAR(reproduce_date)) >= 2021 THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
END condicao_usuario
FROM SpotifyClone.history t1
INNER JOIN users t3
ON t1.user_id = t3.id
GROUP BY t3.name
ORDER BY t3.name;