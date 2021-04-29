class EquiposPage
  include Capybara::DSL

  def create(equipo)
    # checkpoint com timeout explícito
    page.has_css?("#equipoForm")

    # Valida se o valor to texto é maior que zero. Se for é pq uma foto foi adicionada
    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    #colocado o $ para buscar um campo que termina com o termo equipamento
    #usar * para localizar o que contem o termo e ^ para o que inicia com o termo
    find("input[placeholder$=equipamento]").set equipo[:nome]
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^= Valor]").set equipo[:preco]

    click_button "Cadastrar"
  end

  def select_cat(cat)
    #busca pelo valor dentro de um select
    find("#category").find("option", text: cat).select_option
  end

  def upload(file_name)
    # pwd mostra o caminho do projeto. Foi necessário apenas complementar com a estrutura das pastas
    #dentro do projeto
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

    find("#thumbnail input[type=file]", visible: false).set thumb
  end
end
