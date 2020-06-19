class PlantsController < ApplicationController

    # gets all plants
    get '/plants' do 
        authenticate
        @plant = current_user
        @plants = Plant.all
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

    # if !params[:plant][:name].empty?
    #     @plant.plants << Plant.create(name: params["plant"]["name"])
    # end
    # displays edit form based on the plant's ID
    get '/plants/:id/edit' do
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
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
        redirect "/plants/#{@plant.id}"
    end

    delete '/plants/:id' do 
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        @plant.destroy 
        redirect to '/plants'
    end
end