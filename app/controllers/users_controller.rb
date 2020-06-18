class UsersController < ApplicationController

    get '/dashboard' do
        authenticate
        @user = current_user
        erb :'/users/dashboard'
    end

    get '/users' do 
        authenticate
        @user = current_user
        erb :'users/index'
    end

    get '/users/new' do
        @user = User.all 
        erb :'/users/new'
    end

    post '/users' do 
        @user = User.create(params[:user])
        if !params["plant"]["name"].empty?
            @user.plants << User.create(name: params["plant"]["name"])
        end
        redirect '/users/#{@user.id}'
    end

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :'/users/edit'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    patch '/users/:id/edit' do
        @user = User.find(params[:id])
        @user.update(params[:user])
        if !params[:plant][:name].empty?
            @user.plants << User.create(name: params[:plant][:name])
        end
        redirect 'users/#{@user.id}'
    end

end