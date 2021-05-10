describe "POST /equipos/{equipo_id}/bookings" do
  before (:all) do
    payload = { email: "ed@gmail.com", password: "123456" }
    result = Sessions.new.login(payload)
    @nando_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do
      # dado que o usuario possui um equipamento para locacao

      result = Sessions.new.login({ email: "costella@teste.com", password: "123456" })
      costella_id = result.parsed_response["_id"]

      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 150,
      }

      MongoDB.new.remove_equipo(fender[:name], costella_id)

      result = Equipos.new.create(fender, costella_id)
      fender_id = result.parsed_response["_id"]

      # quando solicito a locação da fender
      @result = Equipos.new.booking(fender_id, @nando_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
