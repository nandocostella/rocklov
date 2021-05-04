require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  def remove_users(email)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    users = client[:users]
    users.delete_many({ email: email })
  end

  def get_user(email)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    users = client[:users]
    user = users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, user_id)
    # converte a variavel user_id de string para object id
    obj_id = BSON::ObjectId.from_string(user_id)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    equipos = client[:equipos]
    equipos.delete_many({ name: name, user: obj_id })
  end
end
