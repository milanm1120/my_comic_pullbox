class ComicbookController < ApplicationController
    
    get '/comicbooks' do    #INDEX
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbooks = Comicbook.all
        erb :'/comicbooks/index'
    end

    get '/comicbooks/new' do    #NEW
        redirect_if_not_logged_in       
        erb :'/comicbooks/new'
    end

     post '/comicbooks' do      #CREATE
        redirect_if_not_logged_in       
        comicbook = Comicbook.new(params[:comicbook])
        comicbook.user_id = session[:user_id] #assign new item to current session :user_id
        comicbook.save
        # redirect to "/users/show"
        redirect to "/comicbooks/#{comicbook.id}"
    end

    get '/comicbooks/:id' do    #SHOW
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find_by(id: params[:id])
        if @comicbook
            erb :'/comicbooks/show'          #sends to comicbook/show page if valid comicbook.id entered
        else
            redirect to "/comicbooks"     #invalid comicbook.id redirects back to comicbook/index page
        end
    end

     get '/comicbooks/:id/edit' do  #EDIT
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find_by_id(params[:id])
        redirect_if_not_authorized  #private method
        erb :'/comicbooks/edit'
    end

    patch '/comicbooks/:id' do  #UPDATE
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find_by_id(params[:id])
        redirect_if_not_authorized  #private method
        @comicbook.update(params[:comicbook])
        redirect to "/comicbooks/#{@comicbook.id}"
    end

    delete '/comicbooks/:id' do #DESTROY
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find_by_id(params[:id])
        redirect_if_not_authorized
        @comicbook.destroy
        redirect to "/comicbooks"
    end

private
def redirect_if_not_authorized
    if @comicbook.user != current_user #allows only to user that created the item to edit/delete the item
        redirect to "/comicbooks"
    end
end

end