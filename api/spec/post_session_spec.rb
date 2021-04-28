require_relative "routes/sessions"

describe "POST /session" do
  context "login com sucesso" do
    # o :all faz com que o before execute apenas uma vez o before
    before (:all) do
      @result = Sessions.new.login("teste@teste.com", "123456")
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "senha invalida" do
    # o :all faz com que o before execute apenas uma vez o before
    before (:all) do
      @result = Sessions.new.login("teste@teste.com", "aaaaaa")
    end

    it "valida status code" do
      expect(@result.code).to eql 401
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
    end
  end

end
