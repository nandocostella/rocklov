Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)

  # checkpoint que valida se estou no login antes de sair do step
  expect(@dash_page.on_dash?).to be true
end

Dado("acesso o formulário de cadastro de anuncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenha o seguinte equipamentos") do |table|
  # utilizado método rows para capturar o objeto apresentado em linhas
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro deste item") do
  @equipos_page.create(@anuncio)
end

Entao("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta: {string}") do |expect_alert|
  # have_text verifica se a mensagem contém o texto recebido no argumento
  expect(@alert.dark).to have_text expect_alert
end

# remover anúncios
Dado("que eu tenho um anúncio indesejado:") do |table|
  # código java script para obter o localStorage do "user"
  user_id = page.execute_script("return localStorage.getItem('user')")
  log user_id

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(equipo, user_id)
end

Quando("solicito a exclusão desse item") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("confirmo a exclusão") do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao("não devo ver esse item no meu dashboard") do
  pending # Write code here that turns the phrase above into concrete actions
end
