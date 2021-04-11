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