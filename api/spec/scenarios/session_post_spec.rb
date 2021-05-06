describe "POST /session" do
  context "login com sucesso" do
    # o :all faz com que o before execute apenas uma vez o before
    before (:all) do
      payload = { email: "teste@teste.com", password: "123456" }
      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  #  examples = [
  #    {
  #      title: "Senha Incorreta",
  #      payload: { email: "teste@teste.com", password: "000000" },
  #      code: 401,
  #      error: "Unauthorized",
  #    },
  #    {
  #      title: "Usuario nao existe",
  #      payload: { email: "404@teste.com", password: "000000" },
  #      code: 401,
  #      error: "Unauthorized",
  #    },
  #    {
  #      title: "Email em branco",
  #      payload: { email: "", password: "000000" },
  #      code: 412,
  #      error: "required email",
  #    },
  #    {
  #      title: "Sem o campo email",
  #      payload: { password: "000000" },
  #      code: 412,
  #      error: "required email",
  #    },
  #    {
  #      title: "Senha em branco",
  #      payload: { email: "teste@teste.com", password: "" },
  #      code: 412,
  #      error: "required password",
  #    },
  #    {
  #      title: "Sem o campo senha",
  #      payload: { email: "teste@teste.com" },
  #      code: 412,
  #      error: "required password",
  #    },
  #  ]

  # acessa os exemplos e grava na variável examples
  examples = Helpers::get_fixture("login")

  examples.each do |e|
    context "#{e[:title]}" do
      # o :all faz com que o before execute apenas uma vez o before
      before (:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuário" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
