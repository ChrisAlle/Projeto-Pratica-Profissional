const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const porta = 3000; //porta padrão 
const sql = require('mssql');
const conexaoStr = "Server=regulus;Database=PR118170;User Id= PR118170;Password= PR118170;";//conexao com BD 
sql.connect(conexaoStr) .then(conexao => global.conexao = conexao) .catch(erro => console.log(erro));

// configurando o body parser para pegar POSTS mais tarde 
app.use(bodyParser.urlencoded({ extended: true}));

app.use(bodyParser.json()); //acrescentando informacoes de cabecalho para suportar o CORS

app.use(function(req, res, next) 
        {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "GET, POST, HEAD, OPTIONS, PATCH, DELETE");
    next();
});

//definindo as rotas 
const rota = express.Router();
rota.get('/', (requisicao, resposta) => resposta.json({ mensagem: 'Funcionando!'}));
app.use('/', rota);

//inicia servidor 
app.listen(porta);
console.log('API Funcionando!');

function execSQL(sql, resposta)
{ 
    global.conexao.request() .query(sql) .then(resultado => resposta.json(resultado.recordset)) //.then(resultado => console.log(resultado.recordset)) 
        .catch(erro => resposta.json(erro)); 
}

function validalLogin(){
    var senha = document.getElementById("senha").textContent;
    var nome = document.getElementById("nomeUsuario").textContent;
    var senhaCerta = execSQL('Select senha from Usuario where' + nome + '= Usuario.nomeUsuario');
    if(senha ==senhaCerta){
         document.getElementById("entrar").innerHTML("<a href='entar.html' class='btn white black-text waves-effect waves-red'>"+ nome +"</a>")
         return true;
    }
    else{
        alert("Senha ou nome de usuario incorretos!");
    }
}