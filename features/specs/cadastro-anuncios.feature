#language: pt

Funcionalidade: Cadastro de anuncios
  Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
  Quero cadastrar meus equipamentos
  Para que eu possa disponibiliza-los para locação

  @anuncios
  Cenario: Novo equipo

    Dado que eu estou logado com "teste@teste.com" e "123456"
      E acesso o formulário de cadastro de anuncios
      E que eu tenha o seguinte equipamentos
      | thumb     | fender-sb.jpg |
      | nome      | Fender Strato |
      | categoria | Cordas        |
      | preco     | 200           |
    Quando submeto o cadastro deste item
    Entao devo ver esse item no meu Dashboard

  @temp
  Esquema do Cenario: Tentativa de cadastro de anuncios

    Dado que eu estou logado com "teste@teste.com" e "123456"
      E acesso o formulário de cadastro de anuncios
      E que eu tenha o seguinte equipamentos
      | thumb     | <foto>      |
      | nome      | <nome>      |
      | categoria | <categoria> |
      | preco     | <preco>     |
    Quando submeto o cadastro deste item
    Então deve conter a mensagem de alerta: "<saida>"

    Exemplos:
      | foto          | nome              | categoria | preco | saida                             |
      |               | Violao de nylin   | Cordas    | 150   | Adicione uma foto no seu anúncio! |
      | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!   |
      | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria               |
      | trompete.jpg  | Trompete classico | Outros    |       | Informe o valor da diária         |