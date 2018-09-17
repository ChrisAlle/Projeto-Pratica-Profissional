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
