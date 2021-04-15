Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  #converte a tabela em array e apresenta a primeira posição dele
  user = table.hashes.first

  # Remove os usuários antes de fazer o teste para não inflar o banco com cadastros novos do faker
  MongoDB.new.remove_users(user[:email])
  @signup_page.create(user)
end
