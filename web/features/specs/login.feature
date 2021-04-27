#language: pt

Funcionalidade: Login
  Sendo um usuário cadastrado
  Quero acessar o sistema da Rocklov
  Para que eu possa anunciar meus equipamentos musicais

  @login
  Cenario: Login do usuário

    Dado que acesso a página principal
    Quando submeto minhas credenciais com "teste@teste.com" e "123456"
    Então sou redirecionado para o Dashboard


  Esquema do Cenário: Tentar logar
    Dado que acesso a página principal
    Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
    Então vejo a mensagem de alerta: "<mensagem_output>"

    Exemplos:
      | email_input             | senha_input | mensagem_output                  |
      | nandocostella@gmail.com | abc123      | Usuário e/ou senha inválidos.    |
      | nando@gmail.com         | 123@abc     | Usuário e/ou senha inválidos.    |
      | nandocostella.gmail.com | 123@abc     | Oops. Informe um email válido!   |
      |                         | 123@abc     | Oops. Informe um email válido!   |
      | nandocostella@gmail.com |             | Oops. Informe sua senha secreta! |