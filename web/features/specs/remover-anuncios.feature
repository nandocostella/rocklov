#language: pt

Funcionalidade: Remover anúncios
  Sendo um anunciante que possui um equipamento indesejado
  Quero poder remover esse anúncio
  Para que eu possa o meu dashboard atualizado

  Contexto: Login
    * Login com "spider@hotmail.com" e "123456"

  @temp
  Cenario: Remover anúncio

    Dado que eu tenho um anúncio indesejado:
      | thumb     | telecaster.jpg |
      | nome      | Telecaster     |
      | categoria | Cordas         |
      | preco     | 50             |
    Quando solicito a exclusão desse item
      E confirmo a exclusão
    Entao não devo ver esse item no meu dashboard


  Cenario: Desistir da exclusão

    Dado que eu tenho um anúncio indesejado:
      | thumb     | conga.jpg |
      | nome      | Conga     |
      | categoria | Outros    |
      | preco     | 100       |
    Quando solicito a exclusão desse item
      Mas não confirmo a solicitação
    Entao devo ver esse item no meu dashboard
