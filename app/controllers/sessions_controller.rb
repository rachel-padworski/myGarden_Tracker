class SessionsController < ApplicationController

    get '/login' do
        logged_in_redirect
        erb :'sessions/login'
    end

    get '/signup' do
        logged_in_redirect
        erb :'sessions/signup'
    end

    post '/signup' do
        logged_in_redirect
        @user = User.new(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user.save
            session[:user_id] = @user.id 
            redirect '/dashboard'
        else
            erb :'sessions/signup'
        end
    end

    post '/login' do
        logged_in_redirect
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
        redirect '/'
    end

end