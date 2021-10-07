class ComicbookController < ApplicationController
    
    get '/mycomicbooks' do
        if !logged_in?
            redirect to '/login'
        end
        @comicbooks = Comicbook.all
        erb :'/comicbook/index'
    end

    #Form To Create New Item (new has to go above :id)
    get '/mycomicbooks/new' do
        if !logged_in?
            redirect to '/login'
        end    
        erb :'/comicbook/new'
    end

    #View A Specific Item
    get '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
        erb :'/comicbook/show'
    end

    #Form To Edit A Specific Item
    get '/mycomicbooks/:id/edit' do
        if !logged_in?
            redirect to '/login'
        end
        @comicbook = Comicbook.find(params[:id])
        erb :'/comicbook/edit'
    end

    #Action To Create New Item, new enteries created in the form is sent here.
    post '/mycomicbooks' do
        @comicbook = Comicbook.new(params['comicbook'])
        # binding.pry
        @comicbooks = Comicbook.all
        @comicbook.save
        redirect :"/mycomicbooks" #redirect makes a brand new instance of our application controller
    end

    #Action To Edit Specific Item
    patch '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
        @comicbook.update(params['comicbook'])
        redirect :"/mycomicbooks/#{@comicbook.id}"
    end

    #Delete Specific Item
    delete '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
        @comicbook.destroy
        redirect :'/mycomicbooks'
    end


end