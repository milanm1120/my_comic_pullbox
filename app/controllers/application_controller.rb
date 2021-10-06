require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'session_secret_comicbook'     #prevents information to taperred with
  end

  get "/" do
    erb :'user/login'
  end

end
