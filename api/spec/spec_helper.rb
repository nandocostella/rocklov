require_relative "routes/signup"
require_relative "routes/sessions"
require_relative "routes/equipos"
require_relative "libs/mongo"
require_relative "helpers"

require "digest/md5"

# método para converter senha em MD5
def to_md5(pass)
  return Digest::MD5.hexdigest(pass)
end


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # sementes: Cria os usuários antes de rodar os testes
  config.before(:suite) do
    users = [
      { name: "Roberto Silva", email: "betao@hotmail.com", password: to_md5("123456") },
      { name: "Nando Teste", email: "nando@teste.com", password: to_md5("123456") },
      { name: "Fernando Teste", email: "fernando@teste.com", password: to_md5("123456") },
      { name: "Edward", email: "ed@gmail.com", password: to_md5("123456") },
      { name: "Costella Teste", email: "costella@teste.com", password: to_md5("123456") },
    ]

    MongoDB.new.drop_danger
    MongoDB.new.insert_users(users)
  end
end
