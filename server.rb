module Sinatra
  class Server < Sinatra::Base

    get "/" do
      erb :index
    end

    get "/about" do
        erb :about
    end

    get "/contact" do
        erb :contact
    end

  end
end