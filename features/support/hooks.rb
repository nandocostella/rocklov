Before do
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  #comando para maximizar a tela do navegador
  #page.driver.browser.manage.window.maximize

  #determina um tamanho específico para a janela do navegador novo
  page.current_window.resize_to(1140, 900)
end

# coonfiguração para tirar uma evidência no final de cada cenário usando os hooks.
After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")

  Allure.add_attachment(
    name: "screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
end