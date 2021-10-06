class ComicbookController < ApplicationController
    
    get '/mycomicbooks' do
        @comicbooks = Comicbook.all
        erb :'/comicbook/index'
    end

    #Form To Create New Item (new has to go above :id)
    get '/mycomicbooks/new' do
        erb :'/comicbook/new'
    end

    #View A Specific Item
    get '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
        erb :'/comicbook/show'
    end

    #Form To Edit A Specific Item
    get '/mycomicbooks/:id/edit' do
        @comicbook = Comicbook.find(param[:id])
    end

    #Action To Create New Item, new enteries created in the form is sent here.
    post '/mycomicbooks' do
        @comicbook = Comicbook.new(params)
        # binding.pry
        @comicbooks = Comicbook.all
        @comicbook.save
        redirect "/mycomicbooks" #redirect makes a brand new instance of our application controller
    end

    #Action To Edit Specific Item
    patch '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
    end

    #Delete Specific Item
    delete '/mycomicbooks/:id' do
        @comicbook = Comicbook.find(params[:id])
    end


end