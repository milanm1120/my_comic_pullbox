class UserController < ApplicationController

    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        @user =User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], username: params[:username], password: params[:password])     #instantiating a new user
        # if user.firstname.blank? || user.lastname.blank? || user.email.blank? || user.username.blank? || user.password.blank? || User.find_by_email(params["email"])        # if any of the entry fields are blank or an already existing email address is added, it will redirect to signup
        if !@user.save    
            redirect to '/signup'
        else
            redirect to '/mycomicbooks'
        end
    end
end