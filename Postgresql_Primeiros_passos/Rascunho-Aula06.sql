CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Oliveira');

SELECT * 
 FROM funcionarios
 ORDER BY nome;
 
SELECT * 
 FROM funcionarios
 ORDER BY nome DESC;

SELECT * 
 FROM funcionarios
 ORDER BY nome, matricula;
 
SELECT * 
 FROM funcionarios
 ORDER BY nome, matricula DESC;

SELECT * 
 FROM funcionarios
 ORDER BY 4;

SELECT * 
 FROM funcionarios
 ORDER BY 3, 4, 2;
 
SELECT * 
 FROM funcionarios
 ORDER BY 4 DESC, nome DESC, 2 ASC;
 
SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY nome;
	
SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome;
	
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (20,3);

ELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome;
	
SELECT * FROM funcionarios LIMIT 5;

SELECT *
  FROM funcionarios
  ORDER BY nome
LIMIT 5;

SELECT *
  FROM funcionarios
  ORDER BY id
LIMIT 5
OFFSET 0;

SELECT *
  FROM funcionarios
  ORDER BY id
LIMIT 5
OFFSET 1;

SELECT *
  FROM funcionarios
  ORDER BY id
LIMIT 5
OFFSET 4;

-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros

SELECT COUNT(id),
	   SUM(id),
	   MAX(id),
	   MIN(id),
	   AVG(id)
  FROM funcionarios;
  
SELECT COUNT(id),
	   SUM(id),
	   MAX(id),
	   MIN(id),
	   ROUND(AVG(id))
  FROM funcionarios;
  
SELECT COUNT(id),
	   SUM(id),
	   MAX(id),
	   MIN(id),
	   ROUND(AVG(id), 2)
  FROM funcionarios;

SELECT 
        nome
  FROM funcionarios
  ORDER BY nome;
  
SELECT DISTINCT
        nome,
		sobrenome
  FROM funcionarios
  ORDER BY nome;
  
SELECT DISTINCT
        nome,
		sobrenome,
		COUNT (*)
  FROM funcionarios
  ORDER BY nome;
  
SELECT
        nome,
		sobrenome,
		COUNT (id)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;
  
SELECT
        nome,
		sobrenome,
		COUNT (id)
  FROM funcionarios
  GROUP BY 1, 2
  ORDER BY nome;
  
SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;
	
SELECT curso.nome,
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY 1;

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id;
	
SELECT curso.nome,
	COUNT(aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY 1;	

SELECT curso.nome,
	COUNT(aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	WHERE COUNT(aluno.id) = 0
GROUP BY 1;

SELECT curso.nome,
       COUNT(aluno.id)    
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
   WHERE curso.nome = 'Javascript'
GROUP BY 1

SELECT curso.nome,
       COUNT(aluno.id)    
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
   --WHERE curso.nome = 'Javascript'
GROUP BY 1
   HAVING COUNT(aluno.id) = 0;
   
SELECT curso.nome,
       COUNT(aluno.id)    
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
   --WHERE curso.nome = 'Javascript'
GROUP BY 1
   HAVING COUNT(aluno.id) > 0;
   
SELECT nome
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id)> 1;
	
SELECT nome,
	   COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id)> 1;	
	
SELECT nome,
	   COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) = 1;