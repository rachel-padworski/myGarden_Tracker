require 'pry'
class PlantsController < ApplicationController

    get '/plants' do 
        authenticate
        @user = current_user
        @plants = @user.plants
        erb :'plants/index'
    end

    get '/plants/new' do
        authenticate
        erb :'/plants/new'
    end

    post '/plants' do 
        authenticate
        @user = current_user
        @plant = Plant.new(params)
        if @plant.save
            current_user.plants << @plant 
            redirect "/plants/#{@user.id}"
        else 
            erb :'/plants/new'
        end
    end

    
    get '/plants/:id/edit' do
        authenticate
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        erb :'/plants/edit'
    end

    get '/plants/:id' do
        authenticate
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        erb :'/plants/show'
    end

    patch '/plants/:id' do
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        authorize(@user)
        if @plant && @plant.update(name: params[:name], description: params[:description], how_many: params[:how_many], planting_schedule: params[:planting_schedule], harvest: params[:harvest], location: params[:location])
            redirect "/plants"
        else
            erb :'/plants/edit'
        end
    end

    delete '/plants/:id' do 
        @user = current_user
        @plant = Plant.find_by(id: params[:id])
        authorize(@user)
        @plant.destroy
        redirect '/plants'
    end
end