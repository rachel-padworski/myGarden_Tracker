class ApplicationController < Sinatra::Base
    configure do
        set :views, Proc.new { File.join(root, "../views/") }
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
    end

    get '/' do
        erb :home
    end

    helpers do

        def logged_in_redirect
            redirect '/dashboard' if logged_in?
        end

        def render_navbar
            if logged_in?
                erb :logged_in_navbar
            else
                erb :logged_out_navbar
            end
        end
        
        def current_user
            @user ||= User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!current_user
        end

        def authenticate
            redirect '/login' if !logged_in?
        end

        def authorize(user)
            authenticate 
            redirect "/dashboard" if user != current_user
        end

    end
end