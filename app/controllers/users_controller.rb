class UsersController < ApplicationController

    get '/dashboard' do
        authenticate
        erb :'/users/dashboard'
    end

    get '/users/:id/edit' do
        authenticate
        @user = User.find_by(id: params[:id])
        erb :'/users/edit'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/plants/show'
    end

    patch '/users/:id' do
        authenticate
        @user = User.find_by(params[:user])

        params[:user][:plants].each do |details|
            Plant.update(details)
        end
        @plant = Plant.all
        redirect "/dashboard"
    end

   

end