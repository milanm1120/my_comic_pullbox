class ComicbookController < ApplicationController
    
    get '/comicbooks' do    #INDEX
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbooks = Comicbook.all
        erb :'/comicbooks/index'
    end

    #Offers form To Create New Item (new has to go above :id)
    get '/comicbooks/new' do    #NEW
        redirect_if_not_logged_in       
        erb :'/comicbooks/new'
    end

     #Action To Create New Item, new enteries created in the form is sent here.
     post '/comicbooks' do
        redirect_if_not_logged_in       
        @comicbook = Comicbook.new(params['comicbook'])
        # binding.pry
        @comicbook.user_id = session[:user_id] #assign new item to current session :user_id
        
        @comicbook.save
        redirect to "/users/index" #redirect makes a brand new instance of our application controller
    end

    #View A Specific Item
    get '/comicbooks/:id' do    #SHOW
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find_by(id: params[:id])
        if @comicbook
            erb :'/comicbooks/show'          #sends to comicbook/show page if valid comicbook.id entered
        else
            redirect to "/comicbooks"     #invalid comicbook.id redirects back to comicbook/index page
        end
    end

     #Offers form To Edit A Specific Item
     get '/comicbooks/:id/edit' do
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
        erb :'/comicbooks/edit'
    end

    #Action To Edit/Update Specific Item
    patch '/comicbooks/:id' do
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
        @comicbook.update(params['comicbook'])
        redirect to "/comicbooks/#{@comicbook.id}"
    end

    #Destroy  Specific Item
    delete '/comicbooks/:id' do
        redirect_if_not_logged_in       
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
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