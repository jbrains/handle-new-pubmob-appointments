require 'sinatra'

class HelloWorldApp < Sinatra::Base
    get "/" do
        "Hello, world."
    end
    
    post '/echo' do
        mail = params
        puts mail.inspect
    end
end
