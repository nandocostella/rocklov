Before do
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new

  #comando para maximizar a tela do navegador
  #page.driver.browser.manage.window.maximize

  #determina um tamanho específico para a janela do navegador
  page.current_window.resize_to(1140, 900)
end
