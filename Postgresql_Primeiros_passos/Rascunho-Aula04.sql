SELECT * FROM aluno;
SELECT * FROM curso;

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

SELECT *
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id			 = aluno_curso.curso_id;
	
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;
  
INSERT INTO aluno (nome) VALUES('Nico');
INSERT INTO curso (id, nome) VALUES(3, 'CSS');

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  LEFT JOIN curso ON curso.id = aluno_curso.curso_id;
  
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  RIGHT JOIN curso ON curso.id = aluno_curso.curso_id;
  
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  FULL JOIN curso ON curso.id = aluno_curso.curso_id;
  
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  CROSS JOIN curso;
  
INSERT INTO aluno(nome) VALUES ('João');
  