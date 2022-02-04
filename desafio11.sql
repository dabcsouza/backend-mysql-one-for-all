SELECT name nome_musica,
    CASE
		WHEN t1.name LIKE "%Streets" THEN REPLACE(t1.name, "Streets", "Code Review")
		WHEN t1.name LIKE "%Her Own" THEN REPLACE(t1.name, "Her Own", "Trybe")
		WHEN t1.name LIKE "%Inner Fire" THEN REPLACE(t1.name, "Inner Fire", "Project")
		WHEN t1.name LIKE "%Silly" THEN REPLACE(t1.name, "Silly", "Nice")
		WHEN t1.name LIKE "%Circus"  THEN REPLACE(t1.name, "Circus", "Pull Request")
		WHEN t1.name LIKE "%Streets" THEN REPLACE(t1.name, "Streets", "Code Review")
	END AS novo_nome
 FROM songs t1
 WHERE
	t1.name LIKE "%Streets" OR
    t1.name LIKE "%Her Own" OR
    t1.name LIKE "%Inner Fire" OR
    t1.name LIKE "%Silly" OR
    t1.name LIKE "%Circus" OR
    t1.name LIKE "%Streets"
 ORDER BY novo_nome;