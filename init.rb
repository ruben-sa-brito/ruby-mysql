require_relative 'infra/db.rb'
require_relative 'models/cliente.rb'
require_relative 'orm/db_orm.rb'

# dados = Infra::Db.new.execute('SELECT * FROM clientes')

# puts dados.inspect

clientes = Models::Cliente.todos

clientes.each do |cliente|
    puts cliente.nome
end    
    