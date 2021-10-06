class UserController < ApplicationController

    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        user =User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], username: params[:username], password: params[:password])
    end
end