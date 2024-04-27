require_relative 'infra/db.rb'
require_relative 'models/cliente.rb'
require_relative 'orm/db_orm.rb'
require 'terminal-table'

cliente = Models::Cliente.new
cliente.nome = "James"
cliente.telefone = "(11)1111-1111"
cliente.cpf = "222.222.222-22"

cliente.incluir



# clientes = Models::Cliente.todos
# table = Terminal::Table.new
# table.headings= ["Nome", "Telefone", "Cpf"]

# clientes.each do |cliente|
#     table.add_row([cliente.nome, cliente.telefone, cliente.cpf])
# end 

# puts table
    