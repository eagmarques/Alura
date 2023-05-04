SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;
 
DELETE FROM aluno WHERE id = 1;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
	 ON DELETE CASCADE,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;
	
DELETE FROM aluno WHERE id = 1;

UPDATE aluno
	SET id = 10
	WHERE id =2;
	
UPDATE aluno
	SET id = 20
	WHERE id =4;
	
DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
	 ON DELETE CASCADE
	 ON UPDATE CASCADE,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

SELECT 
	   aluno.id as aluno_id,
	   aluno.nome as "Nome do Aluno",
	   curso.id as curso_id,
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;
	
UPDATE aluno
	SET id = 10
	WHERE id =2;
	
SELECT * FROM aluno_curso;

CREATE TABLE pessoas (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE telefones (
    id INTEGER PRIMARY KEY,
    pessoa_id INTEGER,
    numero VARCHAR(15) NOT NULL,
    FOREIGN KEY (pessoa_id) REFERENCES pessoas (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

INSERT INTO pessoas (id, nome) VALUES (1,'Diogo');
INSERT INTO telefones (id, pessoa_id, numero) VALUES (1,1,'(21) 98765-4321');

UPDATE pessoas SET id = 2 WHERE nome = 'Diogo';
DELETE FROM pessoas WHERE nome = 'Diogo';