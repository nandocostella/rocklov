require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :client, :users, :equipos

  def initialize
    @client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def drop_danger
    client.database.drop
  end

  def insert_users(docs)
    @users.insert_many(docs)
  end

  def remove_users(email)
    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, user_id)
    # converte a variavel user_id de string para object id
    obj_id = BSON::ObjectId.from_string(user_id)
    @equipos.delete_many({ name: name, user: obj_id })
  end

  # cria um objectid aleatório válido mas que não existe para ser usado no teste de retorno 404
  def get_mongo_id
    return BSON::ObjectId.new
  end
end
