require "httparty"

describe "POST /session" do
  context "login com sucesso" do
    # o :all faz com que o before execute apenas uma vez o before
    before (:all) do
      payload = { email: "teste@teste.com", password: "123456" }

      @result = HTTParty.post(
        "http://rocklov-api:3333/sessions",
        body: payload.to_json,
        headers: {
          "Content-Type": "application/json",
        },
      )
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
end
