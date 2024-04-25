Modelo de orm mysql feito em ruby

Componentes do sistema

init.rb
    Responsável por inicializar o sistema, basicamente faz os requirements necessários e instancia os objetos.

dump.rb
    Arquivo de dump, contém instruções sql para criação da estrutra do banco de dados, como também os dados correspondentes.

models/cliente.rb
    Contem o módulo com as classes que representarão as entidades no banco de dados com seus respectivos atributos.

orm/db_orm.rb
    Aqui temos a ponte entre nossos objetos e o banco de dados, contendo os metodos que solicitarão as entidades e a partir delas fornecer os atributos para construir a classe.

infra/db.rb
    Este arquivo é responsavel pelas consultas diretas ao banco de dados executando os comandos sql que são entregues.


