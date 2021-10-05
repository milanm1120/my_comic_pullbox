class ComicbookController < ApplicationController
    
    get "/mycomicbooks" do
        @comicbooks = Comicbook.all
        erb :"/comicbook/index"
    end

    #View A Specific Item
    get "/mycomicbooks/:id" do

    end

    #Form To Create New Item
    get "/mycomicbooks/new" do

    end

    #Form To Edit A Specific Item
    get "/mycomicbooks/:id/edit" do

    end

    #Action To Create New Item
    post "/mycomicbooks" do
    
    end

    #Action To Edit Specific Item
    patch "/mycomicbooks/:id" do
    
    end

    #Delete Specific Item
    delete "/mycomicbooks/:id" do
    
    end


end