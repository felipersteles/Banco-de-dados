
-- Database: ControleDeCursos

-- DROP DATABASE IF EXISTS "ControleDeCursos";

CREATE DATABASE "ControleDeCursos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "ControleDeCursos"
    IS 'Database de cursos profissionzantes';



-- Table: public.curso

-- DROP TABLE IF EXISTS public.curso;

CREATE TABLE IF NOT EXISTS public.curso
(
    cod_curso integer NOT NULL,
    nome_curso character varying(55) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT curso_pkey PRIMARY KEY (cod_curso)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.curso


-- Table: public.discente

-- DROP TABLE IF EXISTS public.discente;

CREATE TABLE IF NOT EXISTS public.discente
(
    matricula integer NOT NULL,
    cpf integer NOT NULL,
    num_rg integer NOT NULL,
    nome_discente character varying(45) COLLATE pg_catalog."default" NOT NULL,
    email character varying(45) COLLATE pg_catalog."default" NOT NULL,
    senha character varying(16) COLLATE pg_catalog."default" NOT NULL,
    cep character(9) COLLATE pg_catalog."default" NOT NULL,
    logradouro character varying(45) COLLATE pg_catalog."default",
    telefone1 integer,
    telefone2 integer,
    CONSTRAINT discente_pkey PRIMARY KEY (matricula)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discente


-- Table: public.discente_turma

-- DROP TABLE IF EXISTS public.discente_turma;

CREATE TABLE IF NOT EXISTS public.discente_turma
(
    cod_turma integer NOT NULL,
    matricula_discente integer NOT NULL,
    nota integer,
    frequencia integer,
    CONSTRAINT discente_turma_pkey PRIMARY KEY (cod_turma, matricula_discente),
    CONSTRAINT discente_turma_cod_turma_fkey FOREIGN KEY (cod_turma)
        REFERENCES public.turma (cod_turma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT discente_turma_matricula_discente_fkey FOREIGN KEY (matricula_discente)
        REFERENCES public.discente (matricula) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discente_turma


-- Table: public.docente_turma

-- DROP TABLE IF EXISTS public.docente_turma;

CREATE TABLE IF NOT EXISTS public.docente_turma
(
    cod_turma integer NOT NULL,
    matricula_docente integer NOT NULL,
    dataadmissao date,
    CONSTRAINT docente_turma_pkey PRIMARY KEY (cod_turma, matricula_docente),
    CONSTRAINT docente_turma_cod_turma_fkey FOREIGN KEY (cod_turma)
        REFERENCES public.turma (cod_turma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT docente_turma_matricula_docente_fkey FOREIGN KEY (matricula_docente)
        REFERENCES public.funcionario (matricula) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.docente_turma


-- Table: public.funcionario

-- DROP TABLE IF EXISTS public.funcionario;

CREATE TABLE IF NOT EXISTS public.funcionario
(
    matricula integer NOT NULL,
    cpf integer NOT NULL,
    num_rg integer NOT NULL,
    nome_discente character varying(45) COLLATE pg_catalog."default" NOT NULL,
    email character varying(45) COLLATE pg_catalog."default" NOT NULL,
    senha character varying(16) COLLATE pg_catalog."default" NOT NULL,
    cep character(9) COLLATE pg_catalog."default" NOT NULL,
    logradouro character varying(45) COLLATE pg_catalog."default",
    telefone1 integer,
    telefone2 integer,
    CONSTRAINT funcionario_pkey PRIMARY KEY (matricula)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.funcionario


-- Table: public.matricula

-- DROP TABLE IF EXISTS public.matricula;

CREATE TABLE IF NOT EXISTS public.matricula
(
    cod_turma integer NOT NULL,
    matricula_discente integer NOT NULL,
    datapagamento date NOT NULL,
    valorpago double precision NOT NULL,
    CONSTRAINT matricula_pkey PRIMARY KEY (cod_turma, matricula_discente),
    CONSTRAINT matricula_cod_turma_fkey FOREIGN KEY (cod_turma)
        REFERENCES public.turma (cod_turma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT matricula_matricula_discente_fkey FOREIGN KEY (matricula_discente)
        REFERENCES public.discente (matricula) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.matricula

-- Table: public.modulo

-- DROP TABLE IF EXISTS public.modulo;

CREATE TABLE IF NOT EXISTS public.modulo
(
    cod_modulo integer NOT NULL,
    descricao text COLLATE pg_catalog."default" NOT NULL,
    cod_curso integer NOT NULL,
    CONSTRAINT modulo_pkey PRIMARY KEY (cod_modulo),
    CONSTRAINT modulo_cod_curso_fkey FOREIGN KEY (cod_curso)
        REFERENCES public.curso (cod_curso) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.modulo


-- Table: public.turma

-- DROP TABLE IF EXISTS public.turma;

CREATE TABLE IF NOT EXISTS public.turma
(
    cod_turma integer NOT NULL,
    cod_modulo integer NOT NULL,
    cod_curso integer NOT NULL,
    datainicio date NOT NULL,
    datatermino date,
    valor double precision NOT NULL,
    cargahoraria integer,
    num_vagas integer NOT NULL,
    conteudo character varying(45) COLLATE pg_catalog."default",
    cod_docente integer NOT NULL,
    CONSTRAINT turma_pkey PRIMARY KEY (cod_turma),
    CONSTRAINT turma_cod_curso_fkey FOREIGN KEY (cod_curso)
        REFERENCES public.curso (cod_curso) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT turma_cod_docente_fkey FOREIGN KEY (cod_docente)
        REFERENCES public.funcionario (matricula) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT turma_cod_modulo_fkey FOREIGN KEY (cod_modulo)
        REFERENCES public.modulo (cod_modulo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.turma