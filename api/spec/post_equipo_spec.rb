describe "POST /equipos" do
  before (:all) do
    payload = { email: "nando@teste.com", password: "123456" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "novo equipo" do
    before(:all) do
      # com o argumento rb ele recupera o valor da imagem corretamente. Sem o argumento a imagem fica em branco
      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"), "rb")

      payload = {
        thumbnail: thumbnail,
        name: "kramer Eddie Van Halen",
        category: "Cordas",
        price: 350,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end

    it "Deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end

  context "não autorizado" do
    before(:all) do
      # com o argumento rb ele recupera o valor da imagem corretamente. Sem o argumento a imagem fica em branco
      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "baixo.jpg"), "rb")

      payload = {
        thumbnail: thumbnail,
        name: "Contra baixo",
        category: "Cordas",
        price: 59,
      }

      @result = Equipos.new.create(payload, nil)
    end

    it "Deve retornar 401" do
      expect(@result.code).to eql 401
    end
  end


end
