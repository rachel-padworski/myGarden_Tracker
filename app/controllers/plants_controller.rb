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
        @plant = Plant.all 
        erb :'/plants/new'
    end

    # creates one plant
    post '/plants' do 
        @user = current_user
        @plant = Plant.create(name: params[:name], description: params[:description], how_many: params[:how_many], planting_schedule: params[:planting_schedule], harvest: params[:harvest], location: params[:location], user: current_user)
        redirect "/plants/#{@plant.id}"
    end

    
    # displays edit form based on the plant's ID
    get '/plants/:id/edit' do
        @plant = Plant.all
        erb :'/plants/edit'
    end

    # displays one plant based on its ID
    get '/plants/:id' do
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        erb :'/plants/show'
    end

    # modifies an existing plant based on its ID
    patch '/plants/:id' do
        @plant = Plant.find_by(id: params[:id])
        @plant.update(params[:plant])
        if @plant.save
            redirect '/dashboard'
        else
            redirect "/plants/#{@plant.id}/edit"
        end
    end

    delete '/plants/:id' do 
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        @plant.destroy 
        redirect to '/plants'
    end
end