Então("sou redirecionado para o Dashboard") do
  expect(@dash_page.on_dash?).to be true
end

# trata o argumento passado em string em todos os steps do @tentativa_cadastro
Então("vejo a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to eql expect_alert
end
