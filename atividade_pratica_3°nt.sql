CREATE DATABASE universidade;
USE universidade;

CREATE TABLE professores (
id_professor INT PRIMARY KEY,
nome VARCHAR(100),
titulacao VARCHAR(100),
area VARCHAR(100) 
);

CREATE TABLE alunos(
id_aluno INT PRIMARY KEY,
nome VARCHAR(100),
idade INT,
cidade VARCHAR(100)
);

CREATE TABLE cursos (
id_cursos INT PRIMARY KEY,
nome_curso VARCHAR(100),
carga_horario INT,
id_professor INT,
FOREIGN KEY (id_professor) REFERENCES professores (id_professor)
);

CREATE TABLE matriculas (
id_matricula INT PRIMARY KEY,
id_aluno INT,
id_cursos INT,
semestre VARCHAR(20),
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_cursos) REFERENCES cursos (id_cursos)
);

INSERT INTO professores VALUES
(1,'Carlos Silva','Mestre','Programação'),
(2,'Ana Souza','Doutora','Banco de Dados'),
(3,'Marcos Lima','Mestre','Redes'),
(4,'Juliana Costa','Doutora','Engenharia de Software'),
(5,'Pedro Alves','Mestre','Segurança da Informação'),
(6,'Fernanda Rocha','Doutora','Inteligência Artificial'),
(7,'Lucas Martins','Mestre','Algoritmos'),
(8,'Patricia Gomes','Doutora','Sistemas Distribuídos'),
(9,'Roberto Dias','Mestre','Computação Gráfica'),
(10,'Camila Torres','Doutora','Ciência de Dados');

INSERT INTO cursos VALUES
(1,'Programação em C',80,1),
(2,'Banco de Dados',60,2),
(3,'Redes de Computadores',70,3),
(4,'Engenharia de Software',90,4),
(5,'Segurança da Informação',60,5);

INSERT INTO alunos VALUES
(1,'João Pedro',20,'Manaus'),
(2,'Maria Clara',22,'Manaus'),
(3,'Lucas Santos',19,'Itacoatiara'),
(4,'Ana Beatriz',21,'Parintins'),
(5,'Pedro Henrique',23,'Manaus'),
(6,'Juliana Mendes',20,'Manacapuru'),
(7,'Carlos Eduardo',24,'Manaus'),
(8,'Fernanda Lima',18,'Coari'),
(9,'Bruno Souza',22,'Manaus'),
(10,'Camila Rocha',21,'Manaus'),
(11,'Rafael Gomes',25,'Tefé'),
(12,'Larissa Alves',20,'Manaus'),
(13,'Matheus Costa',19,'Manaus'),
(14,'Beatriz Martins',22,'Parintins'),
(15,'Gabriel Dias',23,'Manaus'),
(16,'Patricia Souza',21,'Itacoatiara'),
(17,'Daniel Torres',24,'Manaus'),
(18,'Amanda Silva',20,'Manacapuru'),
(19,'Thiago Pereira',22,'Coari'),
(20,'Renata Lopes',21,'Manaus');

INSERT INTO matriculas VALUES
(1,1,1,'2025.1'),
(2,2,2,'2025.1'),
(3,3,1,'2025.1'),
(4,4,3,'2025.1'),
(5,5,2,'2025.1'),
(6,6,4,'2025.1'),
(7,7,5,'2025.1'),
(8,8,3,'2025.1'),
(9,9,1,'2025.1'),
(10,10,2,'2025.1'),
(11,11,4,'2025.1'),
(12,12,5,'2025.1'),
(13,13,3,'2025.1'),
(14,14,2,'2025.1'),
(15,15,1,'2025.1'),
(16,16,4,'2025.1'),
(17,17,5,'2025.1'),
(18,18,2,'2025.1'),
(19,19,3,'2025.1'),
(20,20,1,'2025.1');

SELECT * FROM alunos;

SELECT nome, idade
FROM alunos;

SELECT nome, area
FROM professores;

SELECT * FROM cursos;

SELECT cursos.nome_curso, professores.nome
FROM cursos
JOIN professores
ON cursos.id_professor = professores.id_professor

SELECT alunos.nome, cursos.nome_curso
FROM matriculas
JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
JOIN cursos ON matriculas.id_cursos = cursos.id_cursos;

SELECT 
    alunos.nome
FROM
    matriculas
        JOIN
    alunos ON matriculas.id_aluno = alunos.id_aluno
WHERE
    matriculas.id_cursos = 2;
    
    SELECT COUNT(*) AS total_alunos
FROM alunos;

SELECT cursos.nome_curso, COUNT(matriculas.id_aluno) AS total_alunos
FROM cursos
JOIN matriculas ON cursos.id_cursos = matriculas.id_cursos
GROUP BY cursos.nome_curso;

SELECT alunos.nome, cursos.nome_curso
FROM matriculas
JOIN alunos ON matriculas.id_aluno = alunos.id_aluno
JOIN cursos ON matriculas.id_cursos = cursos.id_cursos;

SELECT cursos.nome_curso, COUNT(matriculas.id_aluno) AS total
FROM cursos
JOIN matriculas ON cursos.id_cursos = matriculas.id_cursos
GROUP BY cursos.nome_curso
HAVING COUNT(matriculas.id_aluno) > 3;

SELECT professores.nome, COUNT(matriculas.id_aluno) AS total_alunos
FROM professores
JOIN cursos ON professores.id_professor = cursos.id_professor
JOIN matriculas ON cursos.id_cursos = matriculas.id_cursos
GROUP BY professores.nome;

SELECT nome, idade
FROM alunos
ORDER BY idade







