class UsersController < ApplicationController

    get '/dashboard' do
        authenticate
        erb :'/users/dashboard'
    end

    get '/users/:id/edit' do
        @user = User.find_by(id: params[:id])
        erb :'/users/edit'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/plants/show'
    end

    patch '/users/:id' do
        @user = User.find_by(id: params[:id])
        @user.update(params[:user])
        redirect "/users/dashboard"
    end

   

end