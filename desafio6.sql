SELECT
	FORMAT(MIN(value), 2) faturamento_minimo,
    FORMAT(MAX(value), 2) faturamento_maximo,
    FORMAT(AVG(value), 2) faturamento_medio,
    FORMAT(SUM(t2.value), 2) faturamento_total
FROM users t1
INNER JOIN plans t2
ON t1.plan_id = t2.id;