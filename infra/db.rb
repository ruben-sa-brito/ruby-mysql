require 'mysql2'
require 'yaml'
require 'erb'
require 'byebug'


module Infra
    class Db
        def initialize
            env = ENV["APP_ENV"] || "dev"
           
            db_config = YAML.safe_load(ERB.new(File.read('./config/database.yml')).result, aliases: true)
            config = db_config[env]
            @client = Mysql2::Client.new(
                        host: config['host'],       
                        port: config['port'], 
                        username: config['user'],   
                        password: config['pass'],
                        database: config['database']    
                        )

        end

        def execute(sql, params = [])
            
            begin
                statement = @client.prepare(sql)
                result = statement.execute(*params)
                return result
            rescue
                statement.close if statement  
            end      
            
        end          
    end
end  
