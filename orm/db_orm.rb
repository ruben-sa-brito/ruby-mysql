require 'json'

module Orm
    
    def self.included(base)
        tabela = base.to_s.split("::").last.downcase + "s"
        dados = Infra::Db.new.execute("desc #{tabela}")
        atributos = dados.map{|dado| dado["Field"]}
        atributos.each do |atributo|
            
            define_method("#{atributo}=") do |valor|
                instance_variable_set("@#{atributo}", valor)
            end  
            define_method("#{atributo}=") do
                instance_variable_get("@#{atributo}")
            end   
        end    
    end       
end           