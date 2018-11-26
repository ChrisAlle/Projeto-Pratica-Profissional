create table Estado (
codEstado int primary key,
nome varchar(50) not null,
)

create table Cidade(
codCidade int primary key,
nome varchar(50) not null,
codEstado int not null,
constraint fkEstado foreign key(codEstado) references Estado(codEstado)
)

create table Restaurante(
codRestaurante int primary key,
nome varchar(50) not null,
tipo varchar(20) not null,
codCidade int not null,
constraint fkCidade foreign key(codCidade) references Cidade(codCidade)
)

create table Prato(
codPrato int primary key,
precoPrato money not null,
tipoPrato varchar(20),
descricao varchar(100),
qtdPessoas int not null,
nomePrato varchar(20) not null,
codRestaurante int not null,
constraint fkRestaurante foreign key(codRestaurante) references Restaurante(codRestaurante)
)

create table Receita(
codReceita int primary key,
tipo varchar(50),
qtdPessoas int,
totalKcal float,
descricao ntext,
nome varchar(20),
)

create table Usuario(
email varchar(60) primary key,
codUsuario int not null,
senha varchar(24),
qtdPedidos int,
nomeUsuario varchar(50),
)

create table Pedido(
codPedido int primary key,
precoPedido money,
emailUsuario varchar(60) not null,
constraint fkUsuario foreign key(emailUsuario) references Usuario(email),
codRestaurante int not null,
constraint fkRestaurantePedido foreign key(codRestaurante) references Restaurante(codRestaurante),
codCidade int not null,
constraint fkCidadePedido foreign key(codCidade) references Cidade(codCidade),
codPrato int not null,
constraint fkPrato foreign key(codPrato) references Prato(codPrato),
)

create proc InsereEstado_sp
@codEstado int,
@nome varchar(50)
as
insert into Estado values(@codEstado,@nome)


InsereEstado_sp 1, 'Sao Paulo',
InsereEstado_sp 2, 'Rio de Janeiro'
InsereEstado_sp 3, 'Minas Gerais'
InsereEstado_sp 4, 'Espírito Santo'
InsereEstado_sp 5, 'Bahia'
InsereEstado_sp 6, 'Paraná'
InsereEstado_sp 7, 'Santa Catarina'
InsereEstado_sp 8, 'Rio Grande do Sul'
InsereEstado_sp 9, 'Sergipe'
InsereEstado_sp 10, 'Alagoas'
InsereEstado_sp 11, 'Pernambuco'
InsereEstado_sp 12, 'Paraíba'
InsereEstado_sp 13, 'Rio Grande do Norte'
InsereEstado_sp 14, 'Ceará'
InsereEstado_sp 15, 'Piauí'
InsereEstado_sp 16, 'Maranhão'
InsereEstado_sp 17, 'Tocantins'
InsereEstado_sp 18, 'Distrito Federal'
InsereEstado_sp 19, 'Goiás'
InsereEstado_sp 20, 'Mato Grosso do Sul'
InsereEstado_sp 21, 'Mato Grosso'
InsereEstado_sp 22, 'Pará'
InsereEstado_sp 24, 'Amapá'
InsereEstado_sp 23, 'Roraima'
InsereEstado_sp 25, 'Amazonas'
InsereEstado_sp 26, 'Acre'
InsereEstado_sp 27, 'Rondônia'

select * from Estado

update Estado set codEstado= 23 where codEstado = 24

create proc InsereCidade_sp
@codCidade int,
@nome varchar(50),
@codEstado int
as
insert into Cidade values(@codCidade,@nome,@codEstado)

InsereCidade_sp 1,'Campinas',1
InsereCidade_sp 2,'São Paulo',1
InsereCidade_sp 3,'Rio de Janeiro',2
InsereCidade_sp 4,'Belo Horizonte',3
InsereCidade_sp 5,'Vitória',4
InsereCidade_sp 6,'Salvador',5
InsereCidade_sp 7,'Curitba',6
InsereCidade_sp 8,'Florianópolis',7
InsereCidade_sp 9,'Porto Alegre',8
InsereCidade_sp 10,'Aracaju',9
InsereCidade_sp 11,'Maceió',10
InsereCidade_sp 12,'Recife',11
InsereCidade_sp 13,'João Pessoa',12
InsereCidade_sp 14,'Natal',13
InsereCidade_sp 15,'Fortaleza',14
InsereCidade_sp 16,'Teresina',15
InsereCidade_sp 17,'São Luís',16
InsereCidade_sp 18,'Palmas',17
InsereCidade_sp 19,'Brasília',18
InsereCidade_sp 20,'Goiânia',19
InsereCidade_sp 21,'Campo Grande',20
InsereCidade_sp 22,'Cuiaba',21
InsereCidade_sp 23,'Belém',22
InsereCidade_sp 24,'Macapá',23
InsereCidade_sp 25,'Boa Vista',24
InsereCidade_sp 26,'Manaus',25
InsereCidade_sp 27,'Rio Branco',26
InsereCidade_sp 28,'Porto Velho',27


select * from Cidade

alter proc InsereReceita_sp
@codReceita int,
@tipo varchar(50),
@qtdPessoas int,
@totalKcal float,
@descricao ntext,
@nome varchar(20),
@horario varchar(15)

as
insert into Receita values(@codReceita,@tipo,@qtdPessoas,@totalKcal,@descricao,@nome,@horario)

create proc InsereRestaurante_sp
@codRestaurante int,
@nome varchar(50) ,
@tipo varchar(20) ,
@codCidade int

as
insert into Restaurante values(@codRestaurante,@nome,@tipo,@codCidade)



alter proc InserePrato_sp
@codPrato int,
@precoPrato money,
@tipoPrato varchar(20),
@descricao varchar(100),
@qtdPessoas int,
@nomePrato varchar(20),
@codRestaurante int,
@horario varchar(15)
as
insert into Prato values(@codPrato,@precoPrato,@tipoPrato,@descricao,@qtdPessoas,@nomePrato,@codRestaurante,@horario)



create proc InsereUsuario_sp
@email varchar(60),
@codUsuario int,
@senha varchar(24),
@qtdPedidos int,
@nomeUsuario varchar(50)
as
insert into Usuario values(@email,@codUsuario,@senha,@qtdPedidos,@nomeUsuario)



alter table Receita
add horario varchar(15)


alter table Prato
add horario varchar(15)

InsereRestaurante_sp 1,'XX','Hamburgueria',1

InsereReceita_sp 1,'Vegano',2,2000,'Corte a abobrinha em fatias finas, como um espaguete, com a ajuda de uma boa faca ou cortador de legumes. Alguns são próprios para fazer espaguete de legumes.
Cozinhe os filetes de abobrinha em água fervente por 3 minutos, escorra bem e reserve.','Macarão de Abrobinha','Almoço'

InserePrato_sp 1,30,'Hamburguer','Lance de carne 200g com queijo e bacon',1,'X-Burguer',1,'Janta'







create proc ValidaRegiao_sp
@codCidade varchar(11),
@codEstado int
as
select nome from Cidade c
where
c.codEstado = @codEstado and
c.codCidade = @codCidade  

alter proc ValidaPreferencia_sp
@tipo varchar(11),
@qtdPessoas int,
@horario varchar(15)
as
select codReceita from Receita r
where
r.tipo = @tipo and
r.qtdPessoas = @qtdPessoas and
r.horario = @horario

create proc ValidaPreferenciaPedido_sp
@tipo varchar(50),
@qtdPessoas int,
@horario varchar(15)
as
select codPrato from Prato p
where
p.tipoPrato = @tipo and
p.qtdPessoas = @qtdPessoas