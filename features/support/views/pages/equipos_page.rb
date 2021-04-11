class EquiposPage
  include Capybara::DSL

  def create(equipo)
    # checkpoint com timeout explícito
    page.has_css?("#equipoForm")

    # pwd mostra o caminho do projeto. Foi necessário apenas complementar com a estrutura das pastas
    #dentro do projeto
    thumb = Dir.pwd + "/features/support/fixtures/images/" + equipo[:thumb]
    
    find("#thumbnail input[type=file]", visible: false).set thumb
    
    #colocado o $ para buscar um campo que termina com o termo equipamento
    #usar * para localizar o que contem o termo e ^ para o que inicia com o termo
    find("input[placeholder$=equipamento]").set equipo[:nome]
    #busca pelo valor dentro de um select
    find("#category").find('option', text: equipo[:categoria]).select_option
    find("input[placeholder^= Valor]").set equipo[:preco]
    
    click_button "Cadastrar"
  end

    
end