use hospital_db;

-- 1
select 
     p.convenio,
		 SUM(c.valor_consulta) AS faturamento_total
	FROM pacientes p
	INNER JOIN consultas c
	ON p.id_paciente = c.id_paciente
	WHERE p.convenio LIKE '%Saúde%'
	AND c.status_consulta = 'Realizada'
	GROUP BY p.convenio;
    
    -- 2
SELECT
    m.especialidade,
    AVG(c.valor_consulta) AS media_consulta
FROM consultas c
INNER JOIN medicos m
    ON c.id_medico = m.id_medico
WHERE m.especialidade LIKE '%Cardiologia%'
  AND c.status_consulta = 'Realizada'
GROUP BY m.especialidade;
  
  -- 3
  SELECT
    q.tipo_quarto,
    AVG(i.valor_diaria) AS media_diaria
FROM internacoes i
INNER JOIN quartos q
    ON i.id_quarto = q.id_quarto
WHERE q.tipo_quarto IN ('Apartamento', 'UTI')
GROUP BY q.tipo_quarto;

-- 4
SELECT
    p.nome_paciente,
    SUM(i.valor_diaria) AS total_diarias
FROM internacoes i
INNER JOIN pacientes p
    ON i.id_paciente = p.id_paciente
WHERE p.nome_paciente LIKE '%Silva%'
GROUP BY p.id_paciente, p.nome_paciente;

-- 5 
SELECT
    c.status_consulta,
    COUNT(p.id_prescricao) AS total_prescricoes
FROM prescricoes p
INNER JOIN consultas c
    ON p.id_consulta = c.id_consulta
WHERE p.medicamento LIKE '%Dipirona%'
   OR p.medicamento LIKE '%Paracetamol%'
GROUP BY c.status_consulta;

-- 6
SELECT
    p.convenio,
    m.especialidade,
    AVG(c.valor_consulta) AS media_consulta
FROM consultas c
INNER JOIN pacientes p
    ON c.id_paciente = p.id_paciente
INNER JOIN medicos m
    ON c.id_medico = m.id_medico
WHERE p.convenio LIKE '%Unimed%'
GROUP BY p.convenio, m.especialidade;

-- 7

SELECT
    p.convenio,
    m.especialidade,
    AVG(c.valor_consulta) AS media_consulta
FROM consultas c
INNER JOIN pacientes p
    ON c.id_paciente = p.id_paciente
INNER JOIN medicos m
    ON c.id_medico = m.id_medico
WHERE p.convenio LIKE '%Unimed%'
GROUP BY p.convenio, m.especialidade;

-- 8

SELECT
    p.convenio,
    AVG(i.valor_diaria) AS media_diaria
FROM internacoes i
INNER JOIN pacientes p
    ON i.id_paciente = p.id_paciente
INNER JOIN quartos q
    ON i.id_quarto = q.id_quarto
WHERE q.tipo_quarto = 'UTI'
GROUP BY p.convenio;

-- 9

SELECT
    m.nome_medico,
    SUM(p.quantidade) AS total_medicamentos
FROM prescricoes p
INNER JOIN consultas c
    ON p.id_consulta = c.id_consulta
INNER JOIN medicos m
    ON c.id_medico = m.id_medico
WHERE c.status_consulta = 'Realizada'
GROUP BY m.nome_medico;

-- 10

SELECT
    p.nome_paciente,
    SUM(c.valor_consulta) AS valor_total,
    AVG(c.valor_consulta) AS media_consultas
FROM consultas c
INNER JOIN pacientes p
    ON c.id_paciente = p.id_paciente
WHERE p.nome_paciente LIKE 'M%'
GROUP BY p.nome_paciente;








    
    
    
    
    
    