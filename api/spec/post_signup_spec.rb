describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Nando", email: "nando@teste.com", password: "123456" }
      MongoDB.new.remove_users(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      # dado que eu tenha um novo usuario
      payload = { name: "Teste2", email: "teste2@teste.com", password: "123456" }
      MongoDB.new.remove_users(payload[:email])

      # e o email desse usuario ja esta cadastrado no sistema
      Signup.new.create(payload)

      # quando faço uma requisição para a rota /signup
      @result = Signup.new.create(payload)
    end

    # entao deve retornar 409
    it "deve retornar 409" do
      expect(@result.code).to eql 409
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = [
    {
      title: "Nome obrigatorio",
      payload: { email: "teste2@teste.com", password: "123456" },
      code: 412,
      error: "required name",
    },
    {
      title: "Email obrigatorio",
      payload: { name: "Fernando", password: "123456" },
      code: 412,
      error: "required email",
    },
    {
      title: "Password obrigatorio",
      payload: { name: "Fernando", email: "teste2@teste.com" },
      code: 412,
      error: "required password",
    },
  ]

  examples.each do |e|
    context "#{e[:title]}" do
      # o :all faz com que o before execute apenas uma vez o before
      before (:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida mensagem de erro" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
