class DashPage
  include Capybara::DSL

  #métodos com o ? retornam sempre verdadeiro ou falso
  def on_dash?
    return page.has_css?(".dashboard")
  end

  def goto_equipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list")
  end
end
