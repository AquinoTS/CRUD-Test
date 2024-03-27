-- Remover tabela Matricula
DROP TABLE IF EXISTS Matricula;

-- Remover tabela Aluno
DROP TABLE IF EXISTS Aluno CASCADE;

-- Remover tabela Materia
DROP TABLE IF EXISTS Materia CASCADE;

-- Remover tabela Professor
DROP TABLE IF EXISTS Professor CASCADE;

-- Remover tabela Curso
DROP TABLE IF EXISTS Curso CASCADE;

-- Criar tabela Curso
CREATE TABLE Curso (
    CursoID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

/*CREATE em SQL é usado para criar objetos de banco 
de dados, como tabelas, índices, visões etc. CREATE 
TABLE é usado especificamente para criar uma nova 
tabela. Ele exige a especificação do nome do objeto 
a ser criado e detalhes sobre sua estrutura, como nomes 
de colunas e tipos de dados. 

CursoID: definida como SERIAL.  É uma coluna de 
autoincremento. Automaticamente atribui valores a essa 
coluna, aumentando-os sequencialmente. PRIMARY KEY 
indica que essa coluna é a chave primária da tabela, 
os valores nesta coluna serão únicos e serão usados 
para identificar exclusivamente cada registro na tabela. 

Nome: VARCHAR(255), string de até 255 caracteres.*/

-- Criar tabela Aluno
CREATE TABLE Aluno (
    AlunoID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
	Ra INT,
    CursoID INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

/* Quando você é definido coluna como uma chave 
estrangeira, está sendo especificado que os valores 
nesta coluna devem corresponder a valores existentes em 
uma coluna especificada em outra tabela, geralmente a 
chave primária daquela tabela. 

CursoID na tabela "Aluno" é uma chave estrangeira que 
referência a coluna CursoID na tabela "Curso". Isso 
significa que cada valor inserido na coluna CursoID da 
tabela "Aluno" deve corresponder a um valor existente na 
coluna CursoID da tabela "Curso". Essa restrição garante 
que um aluno só possa estar associado a um curso que 
realmente exista na tabela de cursos, mantendo a 
consistência dos dados e a integridade referencial do 
banco de dados. 

PRIMEIRO DEFINE A COLUNA CURSOID COMO INT PARA DEPOIS
DIZER QUE ELA REFERENCIA CURSO ID DE CURSO */

-- Criar tabela Professor
CREATE TABLE Professor (
    ProfessorID SERIAL PRIMARY KEY,
	Rp INT,
    Nome VARCHAR(255)
);

-- Criar tabela Matéria
CREATE TABLE Materia (
    MateriaID SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    CursoID INT,
    ProfessorID INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);

-- Criar tabela Matricula (para associar alunos a matérias)
CREATE TABLE Matricula (
    AlunoID INT,
    MateriaID INT,
    PRIMARY KEY (AlunoID, MateriaID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (MateriaID) REFERENCES Materia(MateriaID)
);

/* linha 70: chave primária composta, ou seja, uma chave primária 
que consiste em mais de uma coluna. Significa que 
a combinação de AlunoID e MateriaID deve ser única para 
cada registro na tabela "Matricula". Isso impede que um 
aluno seja matriculado na mesma matéria mais de uma vez.*/

-- Inserir dados na tabela Curso: 
INSERT INTO Curso (Nome) VALUES ('Ciência da Computação');
INSERT INTO Curso (Nome) VALUES ('Engenharia Elétrica');
INSERT INTO Curso (Nome) VALUES ('Engenharia Civil');


-- Inserir dados na tabela Aluno: 
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('João Pedro', 1, 22009250);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Maria Fernanda', 2, 23004945);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Pedro Alves', 1, 20209210);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Amanda Alves', 1, 23209210);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Luigi Bertolli', 1, 21209210);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Enzo Garcia', 1, 24209210);
INSERT INTO Aluno (Nome, CursoID,Ra) VALUES ('Thayna Aquino', 1, 22209210);



INSERT INTO Professor (Nome, Rp) VALUES ('Prof. Ana', 196753);
INSERT INTO Professor (Nome, Rp) VALUES ('Prof. Carlos', 179274);
INSERT INTO Professor (Nome, Rp) VALUES ('Prof. Xastre', 149274);
INSERT INTO Professor (Nome, Rp) VALUES ('Prof. Lucas', 184274);
INSERT INTO Professor (Nome, Rp) VALUES ('Prof. Gabriel', 199274);

/* comando INSERT INTO é usado para adicionar novos 
registros à tabela especificada, fornecendo os valores 
a serem inseridos nas colunas especificadas.*/

/* semelhante ao anterior, mas inclui o ID do curso ao 
qual o aluno está associado. */

-- Inserir dados nas tabelas Matéria e Matricula
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Algoritmos', 1, 1);
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Circuitos Elétricos', 2, 2);
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Algoritmos de Dados', 1, 4);
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Sistema Operacional', 1, 5);
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Banco de Dados', 1, 3);
INSERT INTO Materia (Nome, CursoID, ProfessorID) VALUES ('Formação de Vigas', 3, NULL);



INSERT INTO Matricula (AlunoID, MateriaID) VALUES (1, 2);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (2, 2);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (3, 1);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (3, 2);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (4, 2);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (4, 4);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (5, 3);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (5, 1);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (5, 5);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (6, 6);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (6, 2);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (7, 1);
INSERT INTO Matricula (AlunoID, MateriaID) VALUES (7, 3);




-- Encontre os professores de um aluno específico
SELECT DISTINCT Professor.Nome
FROM Professor
JOIN Materia ON Professor.ProfessorID = Materia.ProfessorID
JOIN Matricula ON Materia.MateriaID = Matricula.MateriaID
JOIN Aluno ON Matricula.AlunoID = Aluno.AlunoID
WHERE Aluno.AlunoID = 5
;
/* Seleciona distintamente o nome dos professores dos quais o aluno 
específico está matriculado. */

/* Utiliza joins para conectar as tabelas Professor, Materia, 
Matricula e Aluno e filtra pelo nome do aluno 'João'. */

-- Quais matérias têm mais de 3 alunos matriculados?
SELECT Materia.Nome, COUNT(Matricula.AlunoID) AS NumAlunos
FROM Materia
JOIN Matricula ON Materia.MateriaID = Matricula.MateriaID
GROUP BY Materia.Nome
HAVING COUNT(Matricula.AlunoID) > 3;

/* Seleciona o nome da matéria e conta o número de alunos 
matriculados nessa matéria. */

/* Usa joins para conectar as tabelas Materia e Matricula. */

/* Agrupa os resultados pelo nome da matéria e filtra os 
grupos com mais de 3 alunos matriculados. */

-- Quais são os alunos de uma determinada matéria?
SELECT Aluno.Nome
FROM Aluno
JOIN Matricula ON Aluno.AlunoID = Matricula.AlunoID
JOIN Materia ON Matricula.MateriaID = Materia.MateriaID
WHERE Materia.MateriaID = 3;

/* pesquisa aluno na matéria Algoritmos */

-- Quantos alunos têm em cada matéria?
SELECT Materia.Nome, COUNT(Matricula.AlunoID) AS NumAlunos
FROM Materia
JOIN Matricula ON Materia.MateriaID = Matricula.MateriaID
GROUP BY Materia.Nome;

-- Existe alguma matéria sem professor atribuído?
SELECT Materia.Nome
FROM Materia
WHERE ProfessorID IS NULL;

-- Liste TODOS os alunos de um determinado professor. É possível evitar repetições de nomes?
SELECT DISTINCT Aluno.Nome
FROM Aluno
JOIN Matricula ON Aluno.AlunoID = Matricula.AlunoID
JOIN Materia ON Matricula.MateriaID = Materia.MateriaID
WHERE Materia.ProfessorID = 2;

-- Qual é o número total de professores?
SELECT COUNT(*) AS TotalProfessores
FROM Professor;

-- Quantos alunos matriculados?

SELECT COUNT(*) AS TotalAlunos
FROM Aluno;

