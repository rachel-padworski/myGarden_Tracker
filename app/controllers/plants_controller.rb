class PlantsController < ApplicationController

    get '/plants' do 
        authenticate
        @plant = current_user
        erb :'plants/index'
    end

    get '/plants/new' do
        @plant = Plant.all 
        erb :'/plants/new'
    end

    post '/plants' do 
        @plant = Plant.create(params[:plant])
        if !params["plant"]["name"].empty?
            @plant.plants << Plant.create(name: params["plant"]["name"])
        end
        redirect '/plants/#{@plant.id}'
    end

    post '/plants/new' do
        redirect '/dashboard'
    end

    get '/plants/:id/edit' do
        @plant = Plant.find(params[:id])
        erb :'/plants/edit'
    end

    get '/plants/:id' do
        @plant = Plant.find(params[:id])
        erb :'/plants/show'
    end

    patch '/plants/:id' do
        @plant = Plant.find(params[:id])
        @plant.update(params["plant"])
        if !params[:plant][:name].empty?
            @plant.plants << Plant.create(name: params[:plant][:name])
        end
        redirect 'plants/#{@plant.id}'
    end

end