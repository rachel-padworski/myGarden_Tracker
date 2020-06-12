class GardenersController < ApplicationController

    get '/index' do 
        authenticate
        @gardener = current_user
        erb :'/users/index'
    end
end