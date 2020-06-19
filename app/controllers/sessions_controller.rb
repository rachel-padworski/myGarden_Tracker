class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id 
            redirect '/dashboard'
        else
            erb :'sessions/signup'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/dashboard'
        else
            @error = "Invalid credentials"
            erb :'sessions/login'
        end
    end

    delete '/logout' do
        session.clear
        redirect "/"
    end


end