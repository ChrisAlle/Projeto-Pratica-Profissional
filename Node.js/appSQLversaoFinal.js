
const express = require('express');
const app = express();         
const bodyParser = require('body-parser');
const porta = 3000; //porta padrão
const sql = require('mssql');
const conexaoStr = "Server=regulus;Database=XXX;User Id=YYY;Password=ZZZ;";

//conexao com BD
sql.connect(conexaoStr)
   .then(conexao => global.conexao = conexao)
   .catch(erro => console.log(erro));

// configurando o body parser para pegar POSTS mais tarde   
app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
//acrescentando informacoes de cabecalho para suportar o CORS
app.use(function(req, res, next) {
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

function execSQL(sql, resposta) {
	global.conexao.request()
				  .query(sql)
				  .then(resultado => resposta.json(resultado.recordset))
          //.then(resultado => console.log(resultado.recordset))
				  .catch(erro => resposta.json(erro));
}

//o simbolo ? indica que id na rota abaixo é opcional
rota.get('/clientes/:id?', (requisicao, resposta) => {
	let filtro = '';
	if (requisicao.params.id) 
		filtro = ' WHERE ID=' + parseInt(requisicao.params.id);
	execSQL('SELECT * from Clientes' + filtro, resposta);
})

// testar no POSTMAN
rota.delete('/clientes/:id', (requisicao, resposta) =>{
	execSQL('DELETE Clientes WHERE ID=' + parseInt(requisicao.params.id), resposta);
  resposta.end(resposta.json({ mensagem: 'Deletado!'}));
})

rota.post('/clientes', (requisicao, resposta) =>{
    const id = parseInt(requisicao.body.id);
    const nome = requisicao.body.nome.substring(0,150);
    const cpf = requisicao.body.cpf.substring(0,11);
    execSQL(`INSERT INTO Clientes(ID, Nome, CPF) VALUES(${id},'${nome}','${cpf}')`, resposta);
    resposta.end(resposta.json({ mensagem: 'Incluído!'}));    
})

rota.patch('/clientes/:id', (requisicao, resposta) =>{
    const id = parseInt(requisicao.params.id);
    const nome = requisicao.body.nome.substring(0,150);
    const cpf = requisicao.body.cpf.substring(0,11);
    execSQL(`UPDATE Clientes SET Nome='${nome}', CPF='${cpf}' WHERE ID=${id}`, resposta);
    resposta.end(resposta.json({ mensagem: 'Alterado!'}));  
})