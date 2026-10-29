create table categoria (
    idCategoria number(10),
    salario number(10,2) not null,
    constraint pk_categoria primary key (idCategoria)
);

create table depto (
    codDepto number(10),
    descricao varchar(50) not null,
    constraint pk_depto primary key (codDepto)
);

create table equipamento (
    codEqui number(10),
    descricao varchar(50) not null,
    status number(1) not null,
    constraint pk_equipamento primary key (codEqui),
    constraint ck_equipamento_status check (status in (0,1))
);

create table funcionario (
    cpf varchar(11),
    nome varchar(50) not null,
    dataNascimento date,
    endereco varchar(50),
    sexo char(1),
    idCategoria number(10) not null,
    constraint pk_funcionario primary key (cpf),
    constraint fk_funcionario_categoria foreign key (idCategoria)
        references categoria (idCategoria)
);

create table projeto (
    idProjeto number(10),
    descricao varchar(50) not null,
    tipo number(1) not null,
    dataInicio date not null,
    codDepto number(10) not null,
    constraint pk_projeto primary key (idProjeto),
    constraint fk_projeto_depto foreign key (codDepto)
        references depto (codDepto)
);

create table funcProjeto (
    cpf varchar(11),
    idProjeto number(10),
    dataInicio date not null,
    tempoAlo varchar(20) not null,
    funcao varchar(20) not null,
    constraint pk_funcProjeto primary key (cpf, idProjeto),
    constraint fk_funcProjeto_funcionario foreign key (cpf)
        references funcionario (cpf),
    constraint fk_funcProjeto_projeto foreign key (idProjeto)
        references projeto (idProjeto)
);

create table equiProjeto (
    idProjeto number(10),
    codEqui number(10),
    constraint pk_equiProjeto primary key (idProjeto, codEqui),
    constraint fk_equiProjeto_projeto foreign key (idProjeto)
        references projeto (idProjeto),
    constraint fk_equiProjeto_equipamento foreign key (codEqui)
        references equipamento (codEqui)
);


