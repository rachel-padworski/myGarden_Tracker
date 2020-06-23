require 'pry'
class PlantsController < ApplicationController

    # gets all plants
    get '/plants' do 
        authenticate
        @user = current_user
        @plant = Plant.all
        erb :'plants/index'
    end

    # displays create new plant form
    get '/plants/new' do
        authenticate
        @plant = Plant.all 
        erb :'/plants/new'
    end

    # creates one plant
    post '/plants' do 
        authenticate
        @user = current_user
        @plant = Plant.create(name: params[:name], description: params[:description], how_many: params[:how_many], planting_schedule: params[:planting_schedule], harvest: params[:harvest], location: params[:location], user: current_user)
        redirect "/plants/#{@user.id}"
    end

    
    # displays edit form based on the plant's ID
    get '/plants/:id/edit' do
        authenticate
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        erb :'/plants/edit'
    end

    # displays one plant based on its ID
    get '/plants/:id' do
        authenticate
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        erb :'/plants/show'
    end

    # modifies an existing plant based on its ID
    patch '/plants/:id' do
        authenticate
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        
        
        @plant.update(name: params[:name], description: params[:description], how_many: params[:how_many], planting_schedule: params[:planting_schedule], harvest: params[:harvest], location: params[:location])
        if @plant.save
            redirect "/plants"
        else
            redirect "/plants/#{@user.id}/edit"
        end
    end

    delete '/plants/:id' do 
        authenticate
        @plant = Plant.find_by(id: params[:id])
        @plant.delete
        redirect "/plants"
    end
end