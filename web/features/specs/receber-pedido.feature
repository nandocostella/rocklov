#language: pt

Funcionalidade: Receber pedido de alocação
  Sendo um anunciante que possui equipamentos cadastrados
  Desejo receber pedidos de alocação
  Para que eu possa decidir se quero aprova-los ou rejeita-los

  Cenario: Receber pedido

    Dado que meu perfil de anunciante é "joao@anunciante.com" e "123456"
      E que eu tenho o seguinte equipamento cadastrados
      | thumb     | trompete.jpg |
      | nome      | Trompete     |
      | categoria | Outros       |
      | preco     | 100          |
      E acesso meu dashboard
    Quando "maria@locataria.com" e "123456" solicita a locação desse equipamento
    Entao devo ser a seguinte mensagem:
      """
      maria@locataria.com deseja alugar o equipamento: Trompete em: DATA_ATUAL
      """
      E devo ver os links "ACEITAR" e "REJEITAR" no pedido