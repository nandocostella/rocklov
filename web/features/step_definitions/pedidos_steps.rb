Dado("que meu perfil de anunciante é {string} e {string}") do |email, password|
  @email_anunciante = email
  @pass_anunciante = password
end

Dado("que eu tenho o seguinte equipamento cadastrados") do |table|
  # código java script para obter o localStorage do "user"
  user_id = SessionsService.new.get_user_id(@email_anunciante, @pass_anunciante)

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  MongoDB.new.remove_equipo(@equipo[:name], @email_anunciante)

  result = EquiposService.new.create(@equipo, user_id)
  @equipo_id = result.parsed_response["_id"]
  log @equipo_id
end

Dado("acesso meu dashboard") do
  @login_page.open
  @login_page.with(@email_anunciante, @pass_anunciante)
  sleep 5

  # checkpoint que valida se estou no login antes de sair do step
  expect(@dash_page.on_dash?).to be true
end

Quando("{string} e {string} solicita a locação desse equipamento") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Entao("devo ser a seguinte mensagem:") do |doc_string|
  pending # Write code here that turns the phrase above into concrete actions
end

Entao("devo ver os links {string} e {string} no pedido") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end
