require 'json'

module Orm
    
    def self.included(base)
        base.extend(MetodosDeClasse)
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
        tabela = obj.to_s.split("::").last.downcase + 's'
    end
              
end           