Dado('que eu estou logado com {string} e {string}') do |email, password|
    @email = email

    @login_page.open
    @login_page.with(email, password)
end
  
Dado('acesso o formulário de cadastro de anuncios') do
    @dash_page.goto_equipo_form
end


Dado('que eu tenha o seguinte equipamentos') do |table|
    # utilizado método rows para capturar o objeto apresentado em linhas
    @anuncio = table.rows_hash

    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro deste item') do
    @equipos_page.create(@anuncio)
end
  
Entao('devo ver esse item no meu Dashboard') do
    expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end