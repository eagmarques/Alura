SELECT * FROM aluno WHERE cpf IS NULL;
SELECT * FROM aluno WHERE cpf IS NOT NULL;

SELECT * FROM aluno WHERE idade = 35;
SELECT * FROM aluno WHERE idade != 36;
SELECT * FROM aluno WHERE idade >= 35;

/*BETEWEEN eh inclusivo*/
SELECT * FROM aluno WHERE idade BETWEEN 34 AND 35;

SELECT * FROM aluno WHERE nome LIKE 'D%' AND cpf IS NOT NULL;

SELECT * FROM aluno 
	WHERE nome LIKE 'Diogo' 
	OR nome LIKE 'Rodrigo'
	OR nome LIKE 'Nico%';

/*legal para entender o uso do WHERE com AND*/
SELECT * FROM aluno 
	WHERE nome LIKE 'Diogo'
	AND nome LIKE 'Nico%';
	
SELECT * FROM aluno 
	WHERE nome LIKE '%Steppat'
	AND nome LIKE 'Nico%';