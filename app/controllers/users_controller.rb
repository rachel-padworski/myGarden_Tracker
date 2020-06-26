class UsersController < ApplicationController

    get '/dashboard' do
        authenticate
        erb :'/users/dashboard'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/plants/show'
    end
end