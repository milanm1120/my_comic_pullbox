class ComicbookController < ApplicationController
    
    get '/mycomicbooks' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbooks = Comicbook.all
        erb :'/comicbook/index'
    end

    #Form To Create New Item (new has to go above :id)
    get '/mycomicbooks/new' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        erb :'/comicbook/new'
    end

    #View A Specific Item
    get '/mycomicbooks/:id' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbook = Comicbook.find(params[:id])
        erb :'/comicbook/show'
    end

    #Form To Edit A Specific Item
    get '/mycomicbooks/:id/edit' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
        erb :'/comicbook/edit'
    end

    #Action To Create New Item, new enteries created in the form is sent here.
    post '/mycomicbooks' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbook = Comicbook.new(params['comicbook'])
        # binding.pry
        @comicbook.user_id = session[:user_id] #assign new item to current session :user_id
        @comicbook.save
        redirect to :'/mycomicbooks' #redirect makes a brand new instance of our application controller
    end

    #Action To Edit Specific Item
    patch '/mycomicbooks/:id' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
        @comicbook.update(params['comicbook'])
        redirect to :"/mycomicbooks/#{@comicbook.id}"
    end

    #Delete Specific Item
    delete '/mycomicbooks/:id' do
        redirect_if_not_logged_in       #private method in applicaiton_controller to redirect if not logged in
        @comicbook = Comicbook.find(params[:id])
        redirect_if_not_authorized  #private method
        @comicbook.destroy
        redirect :'/mycomicbooks'
    end

private
def redirect_if_not_authorized
    if @comicbook.user != current_user #allows only to user that created the item to edit/delete the item
        redirect to '/mycomicbooks'
    end
end

end