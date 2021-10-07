class UserController < ApplicationController

    get '/login' do
        erb :'/user/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password]) #order matters, finds user first and then authenticates password
            session[:user_id] = @user.id
            redirect to '/mycomicbooks'
        else
            redirect to '/login'
        end
    end

    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        @user =User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], username: params[:username], password: params[:password])     #instantiating a new user
        # if user.firstname.blank? || user.lastname.blank? || user.email.blank? || user.username.blank? || user.password.blank? || User.find_by_email(params["email"])      # if any of the entry fields are blank or an already existing email address is added, it will redirect to signup
        if !@user.save    
            redirect to '/signup'
        else
            @user.save
            session[:user_id] = @user.id
            redirect to '/mycomicbooks'
        end
    end

    post '/logout' do
        session.clear
        redirect to '/login'
    end
end