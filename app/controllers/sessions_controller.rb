class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        @gardener = Gardener.new(name: params[:name], username: params[:username], password: params[:password])
        if @gardener.save
            session[:user_id] = @gardener.id 
            redirect '/index'
        else
            erb :'sessions/signup'
        end
    end

    post '/login' do
        gardener = Gardener.find_by(username: params[:username])
        if gardener && u.authenticate(params[:password])
            session[:uder_id] = gardener.id
            redirect '/index'
        else
            @error = "Invalid credentials"
            erb :'sessions/login'
        end
    end



end