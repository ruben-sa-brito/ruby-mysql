require_relative 'infra/db.rb'
require_relative 'models/cliente'

# dados = Infra::Db.new.execute('SELECT * FROM clientes')

# puts dados.inspect

cliente = Models::Cliente.new

puts cliente.methods - Class.methods