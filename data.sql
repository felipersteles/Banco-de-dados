
INSERT INTO discente (matricula, cpf, num_rg, nome_discente, email, senha, cep)
VALUES
(1,2,3,'felipe teles','email@','senha',123),
(4,5,6,'vini cerveira','email@','senha',456),
(7,8,9,'rodrigo pontes','email@','senha',789);

INSERT INTO funcionario (matricula, cpf, num_rg, nome_discente, email, senha, cep)
VALUES
(3,2,1, 'simara vieira', 'email@', 'senha', 321),
(6,5,4,'geraldo braz','email@','senha',654),
(9,8,7,'anselmo paiva','email@','senha',987);

INSERT INTO curso (cod_curso, nome_curso)
VALUES 
(123, 'computacao'),
(456, 'quimica');

INSERT INTO modulo (cod_modulo, descricao, cod_curso)
VALUES 
(12, 'Primeiro modulo conhecendo SQL', 123),
(34, 'Segundo modulo conhecendo SGBD', 123),
(56, 'Terceiro modulo conhecendo quimica', 456);

INSERT INTO turma(cod_turma, cod_modulo, cod_curso, datainicio, datatermino, valor, cargahoraria, num_vagas, cod_docente)
VALUES
(11, 12, 123, '2017-03-14','2017-03-15', 45.50, 64, 13, 3),
(12, 12, 123, '2018-05-15', '2019-02-14', 34.50, 64, 13, 3),
(21, 34, 123, '2018-05-30','2018-08-28',40, 40, 13, 6),
(22, 34, 123, '2019-05-30','2019-07-17',54.30, 102, 13, 6),
(31, 56, 456, '2020-02-02','2021-02-02',34.20, 100, 13, 9);

INSERT INTO discente_turma(cod_turma, matricula_discente, nota, frequencia)
VALUES
(11, 1, 100, 0),
(12, 1, 100, 0),
(21, 4, 70, 4),
(31, 7, 70, 12);

INSERT INTO docente_turma(cod_turma, matricula_docente, dataadmissao)
VALUES
(11, 3,'2018-01-01'),
(12, 3, '2018-01-02'),
(21, 6, '2018-01-02'),
(31, 9, '2010-01-01');

INSERT INTO matricula(cod_turma, matricula_discente, datapagamento, valorpago)
VALUES
(11, 1, '2022-07-25',100),
(21, 6, '2022-07-25',100.10),
(32, 7, '2022-07-25',100.20);