class UsersController < ApplicationController

    get '/login' do
        if logged_in?
            redirect to "/users/#{current_user.id}"
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password]) #order matters, finds user first and then authenticates password
            session[:user_id] = user.id
            redirect to "/mycomicbooks"
        else
            redirect to "/login"
        end
    end

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to "/users/#{current_user.id}"
        end
    end

    post '/signup' do
        @user = User.new(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], username: params[:username], password: params[:password])     #instantiating a new user
        # if user.firstname.blank? || user.lastname.blank? || user.email.blank? || user.username.blank? || user.password.blank? || User.find_by_email(params["email"])      # if any of the entry fields are blank or an already existing email address is added, it will redirect to signup
        if @user.valid?
            # binding.pry
            session[:user_id] =@user.id   
            @user.save
            redirect to "/users/#{current_user.id}"
        else
            redirect "/signup"
        end
    end

    get '/users/:id' do
        if logged_in? && params[:id].to_i  == current_user.id
            current_user #private method
            erb :'/users/show'
        else
            redirect to "/login"
        end
    end

    post '/logout' do
        session.clear
        redirect to "/login"
    end
end