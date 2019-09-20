drop table area;
drop table curso;
drop table disciplina;
drop table professor_disciplina ;
drop table professor;
drop table usuario;
drop table questao;
drop table avaliacao;
drop sequence sq_curso;
drop sequence sq_area;
drop sequence sq_disciplina;
drop sequence sq_professor;
drop sequence sq_usuario;
drop sequence sq_questao;
drop sequence sq_avaliacao;

create table area(
    idArea INT not null PRIMARY KEY,
    nome VARCHAR2(50)
);

create table curso(
    idCurso INT not null PRIMARY KEY,
    nome VARCHAR2(50),
    idArea INT NOT NULL,
    FOREIGN KEY(idArea) REFERENCES area(idArea)
);

create table disciplina(
    idDisciplina INT PRIMARY KEY,
    nome VARCHAR2(50),
    idCurso INT NOT NULL,
    FOREIGN KEY(idCurso) REFERENCES curso(idCurso)
);

create table professor(
    idProfessor INT not null PRIMARY KEY,
    nome VARCHAR2(50),
    email VARCHAR2(50),
    telefone VARCHAR2(50),
    cpf VARCHAR2(50)
);

create table professor_disciplina(
    idDisciplina int not null,
    idProfessor int not null,
    FOREIGN KEY(idDisciplina) REFERENCES disciplina(idDisciplina),
    FOREIGN KEY(idProfessor) REFERENCES professor(idProfessor)
);

create table usuario(
    idUser INT not null PRIMARY KEY,
    nome VARCHAR2(50),
    email VARCHAR2(50),
    senha VARCHAR2(50)
);

create table avaliacao(
    idAvaliacao INT not null PRIMARY KEY,
    nomeAvaliador VARCHAR(75),
    email VARCHAR(75),
    horaInicio TIMESTAMP(6),
    horaConclusao TIMESTAMP(6),
    vlProvaExp INT,
    vlQuestExp INT,
    sumVlQuest INT,
    refBibliograficas VARCHAR(500),
    pQuestMultEscDisc VARCHAR(75),
    vlTotal INT,
    eqDistVlQuest VARCHAR(75),
    ppQuestContext VARCHAR(75),
    obs VARCHAR(1000),
    media number(6, 2),
    numeroQuests INT,
    idDisciplina INT NOT NULL,
    FOREIGN KEY (idDisciplina) REFERENCES disciplina(idDisciplina)
);

create table questao(
    idQuestao INT PRIMARY KEY,
    resultado VARCHAR2(150),
    observacao VARCHAR2(1000),
    idAvaliacao INT not null,
    FOREIGN KEY (idAvaliacao) REFERENCES avaliacao(idAvaliacao)
);

create sequence sq_curso;
create sequence sq_area;
create sequence sq_disciplina;
create sequence sq_professor;
create sequence sq_usuario;
create sequence sq_questao;
create sequence sq_avaliacao;

insert into area values (sq_area.NEXTVAL, 'Ciências Humanas');
insert into area values (sq_area.NEXTVAL, 'Ciências Exatas');
insert into area values (sq_area.NEXTVAL, 'Saúde');

insert into curso values(sq_curso.NEXTVAL, 'Direito', 1);
insert into curso values(sq_curso.NEXTVAL, 'Design', 2);
insert into curso values(sq_curso.NEXTVAL, 'Medicina', 3);
insert into curso values(sq_curso.NEXTVAL, 'SI', 2);

insert into professor values (sq_professor.NEXTVAL, 'Vinny','vinny@hcvr.com', '24999954782', '12345678912');
insert into professor values (sq_professor.NEXTVAL, 'Vinny Filho', 'vinnyF@hcvr.com', '24999968782', '12631678912');

insert into disciplina values(sq_disciplina.NEXTVAL,'História dos Historiadores', 1);
insert into disciplina values(sq_disciplina.NEXTVAL,'Matemagica', 2);

insert into usuario values(sq_usuario.NEXTVAL, 'Preula', 'prepre@la.com', 'preulinha123');
insert into usuario values(sq_usuario.NEXTVAL, 'Voltorb', 'voltorb@eletric.com', 'voltidaumchoque');

insert into avaliacao values(sq_avaliacao.NEXTVAL, 'ava_1', 'aaa@aaa.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 10, 10, 10, 'aaa', 'aaa', 10, 'aaaa', 'aaaa', 'aaaaa', 1, 10, 1);
insert into avaliacao values(sq_avaliacao.NEXTVAL, 'ava_2', 'bbb@bbb.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5, 5, 5, 'bbb', 'bbb', 10, 'bbbb', 'bbbb', 'bbbb', 6, 10, 1);
insert into avaliacao values(sq_avaliacao.NEXTVAL, 'ava_3', 'aaa@aaa.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 10, 10, 10, 'aaa', 'aaa', 10, 'aaaa', 'aaaa', 'aaaaa', 5, 10, 1);
insert into avaliacao values(sq_avaliacao.NEXTVAL, 'ava_4', 'bbb@bbb.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 10, 9, 5, 'bbb', 'bbb', 10, 'bbbb', 'bbbb', 'bbbb', 10, 10, 1);
insert into area values(4, 'Balbúrdia');
insert into professor_disciplina values(1, 1);
insert into professor_disciplina values(1, 2);

insert into questao values(sq_questao.NEXTVAL, 'bom', 'observei que a prova tava bacana', 1);
insert into questao values(sq_questao.NEXTVAL, 'mal', 'observei que a prova tava ruim', 2);
insert into questao values(sq_questao.NEXTVAL, 'bom', 'observei que a prova tava bacana', 1);
insert into questao values(sq_questao.NEXTVAL, 'mal', 'observei que a prova tava ruim', 2);
insert into questao values(sq_questao.NEXTVAL, 'mal', 'observei que a prova tava ruim', 1);

SELECT * FROM avaliacao
INNER JOIN disciplina ON disciplina.idDisciplina = avaliacao.idDisciplina
INNER JOIN curso ON curso.idCurso = disciplina.idCurso;

SELECT * FROM avaliacao
INNER JOIN disciplina ON disciplina.idDisciplina = avaliacao.idDisciplina
INNER JOIN questao ON questao.idavaliacao = avaliacao.idavaliacao;

select resultado,COUNT(idquestao) FROM questao GROUP BY resultado HAVING (questao.resultado IS NOT NULL);
select idAvaliacao,AVG(vlProvaExp) FROM avaliacao GROUP BY idAvaliacao HAVING AVG(vlProvaExp) > 5;

select resultado,nomeavaliador,COUNT(idquestao) FROM questao INNER JOIN avaliacao ON questao.idavaliacao = avaliacao.idavaliacao GROUP BY resultado,avaliacao.nomeavaliador ;


-- Consulta simples com apenas uma tabela - Retorna os IDs das avaliações onde o nome do avaliador é diferente do nome do avaliador que avaliou a prova onde a média foi igual a 1
CREATE OR REPLACE FORCE VIEW v_avaliadorcritico 
AS
SELECT
    idavaliacao
    FROM
    avaliacao
    WHERE nomeavaliador <> (SELECT nomeavaliador FROM avaliacao WHERE media = 1);  

-- Subconsulta com cláusula any
--Retorna o ID das avaliações onde a média é maior que qualquer avaliação em que o somátorio do valor de questões é = a 5
CREATE OR REPLACE FORCE VIEW v_avaliacao 
AS
SELECT
    idavaliacao
    FROM
    avaliacao
    WHERE media > any (SELECT media FROM avaliacao WHERE sumvlquest = 5);  
    
--Subconsulta complexa - Retorna nome dos cursos da área de ciências exatas
CREATE OR REPLACE FORCE VIEW v_nomecursosexatas
AS
SELECT
    nome
    FROM
    curso
    WHERE
    idarea = ( select idarea from area where nome = 'Ciências Exatas');
    
-- Subconsulta utilizando a cláusa all - Retorna o nome das disciplinas onde o id da disciplina seja igual a todos os ids das disciplinas com media maior que 7
CREATE OR REPLACE FORCE VIEW v_discmediamaiorsete
AS
SELECT
    nome
    from
    disciplina
    where
    iddisciplina = all(select iddisciplina from avaliacao where media > 7);
    
CREATE OR REPLACE FORCE VIEW v_profsdehistoria
AS
SELECT
    nome
    from
    professor
    where
    idprofessor in(select idprofessor from professor_disciplina where iddisciplina = 1);
    
-- Retorna o nome e id das disciplinas com o nome e id dos professores vinculados a elas (ou não)
CREATE OR REPLACE FORCE VIEW v_discprofs
AS
SELECT d.nome nome_disc, g.nome nome_prof, f.iddisciplina id_disc, f.idprofessor id_prof FROM disciplina d LEFT JOIN professor_disciplina f ON d.iddisciplina = f.iddisciplina JOIN professor g ON f.idprofessor = g.idprofessor;

-- Retorna o nome de todas as áreas e os cursos vinculadas a ela (ou não)
CREATE OR REPLACE FORCE VIEW v_discprofs
AS
SELECT a.nome nome_area, c.nome nome_curso FROM curso c RIGHT JOIN area a ON c.idarea = a.idarea;


--Retorna uma view com todas as informações necessárias para a criação de um relatório sobre cada disciplina e suas avaliações 
CREATE OR REPLACE FORCE VIEW v_para_relatorio
AS
SELECT * from disciplina d full outer join avaliacao a on d.iddisciplina = a.iddisciplina; 

--PL/SQL
SET SERVEROUTPUT ON 

-- 1 bloco
DECLARE 
    nome_prof professor.nome%TYPE;
BEGIN
    SELECT nome INTO nome_prof FROM professor WHERE idprofessor = 1;
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'O nome do professor com o ID igual a 1 é: ' || nome_prof); 
    
EXCEPTION
   when NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Sem nome para o ID selecionado'); 
END;

-- 2 bloco
DECLARE 
    nome_curso curso.nome%TYPE;
BEGIN
    SELECT nome INTO nome_curso FROM curso WHERE idarea = 2;
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'O(s) nome(s) do(s) curso(s) com o ID de area igual a 1 é: ' || nome_curso); 
    
EXCEPTION
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE(chr(10) || 'Sem nome para o ID da area selecionado'); 
    when TOO_MANY_ROWS then
        DBMS_OUTPUT.PUT_LINE(chr(10) || 'A area selecionada só pode ter um curso');
END;



-----------------


--Quantas vezes a disciplina informada foi avaliada
SET SERVEROUTPUT ON 

DECLARE 
    v_disciplina varchar2(150);
    v_iddisciplina int;
    v_avaliacao int;
BEGIN
    v_iddisciplina := :v0;
    SELECT count(idAvaliacao) into v_avaliacao 
    FROM avaliacao a inner join disciplina d on ( d.idDisciplina = a.idDisciplina)
    WHERE v_iddisciplina = d.idDisciplina  and ;
    DBMS_OUTPUT.PUT_LINE('Quantas vezes a disciplina foi avaliada ' || v_avaliacao);
END;

SELECT * FROM avaliacao 
where to_char(trunc(horainicio),'YYYY') BETWEEN (SELECT to_number(to_char(trunc(sysdate),'YYYY')) -2 FROM avaliacao where rownum =1) and (SELECT to_char(trunc(sysdate),'YYYY') FROM avaliacao where rownum = 1 )


