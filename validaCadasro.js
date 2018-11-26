var nomeUsuario;
var senhaUsuario;
var emailUsuario;

function validaSenha(){
            var senha1 = document.getElementById("senha1").textContent;
            var senha2 = document.getElementById("senha2").textContent;
            
            if(senha1 != senha2){
                alert("Senha inconpatível");
                return false;
            }
    
            return true;
        }

function validaTamanhoNomeUsuario(){
    nomeUsuario = document.getElementById("nomeUsuario").textContent;
    if(nomeUsuario.length > 30){
        alert("Nome de usuario grande de mais!");
        return false;
}
    return true;
        
} 

