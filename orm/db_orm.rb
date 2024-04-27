require 'json'

module Orm
    
    def self.included(base)
        base.extend(MetodosDeClasse)
        base.include(MetodosDeInstancia)
        tabela = tabela(base)
        dados = Infra::Db.new.execute("desc #{tabela}")
        atributos = dados.map{|dado| dado["Field"]}
        atributos.each do |atributo|
            
            define_method("#{atributo}=") do |valor|
                instance_variable_set("@#{atributo}", valor)
            end  
            define_method("#{atributo}") do
                instance_variable_get("@#{atributo}")
            end   
        end    
    end

    module MetodosDeInstancia
        def incluir
            debugger
            tabela = Orm::tabela(self)
            dados = Infra::Db.new.execute("desc #{tabela};")
            fields = dados.map { |row| row['Field'] }
            values = self.instance_variables.map {|value| self.eval("#{value}")}
            
            sql = "INSERT INTO #{tabela} (#{fields[1..-1].join(", ")}) VALUES (#{('?, '*values.length)[...-2]});"
            
            Infra::Db.new.execute(sql, values)

        end
    end        


    module MetodosDeClasse
        def todos
            tabela = Orm::tabela(self)
            dados = Infra::Db.new.execute("select * from #{tabela}")
            clientes = []
            dados.each do |dado|
                cliente = self.new
                (cliente.methods - Class.methods).each do |method|   
                                     
                    key = method.to_s.chomp('=')
                    if method.to_s.end_with?('=')
                        cliente.instance_variable_set("@#{key}", dado[key])
                    end   
                end 
                puts cliente.nome    
                clientes << cliente
            end
            clientes
        end 
    end

    private
    def self.tabela(obj)
        tabela = obj.to_s.split("::")[1][0..6].downcase + 's'
    end
              
end           