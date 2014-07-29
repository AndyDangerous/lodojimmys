require 'pry'
require 'pony'
require 'bundler'
require 'haml'
require 'csv'
Bundler.require

require_relative 'business_logic/contact_us'
require_relative 'business_logic/menu_db'


class JimmysApp < Sinatra::Base
  set :method_override, true
  set :public_folder, 'public'

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    enable :sessions
  end

  not_found do
    haml :error
  end

  get '/test' do
    haml :test
  end

  get '/' do
    haml :index
  end

  get '/about_us' do
    haml :about_us
  end

  get '/menu_3' do
    haml :menu_3
  end

  get '/menu_4' do
    haml :menu_4
  end

  get '/location' do
    haml :location
  end

  get '/contact' do
    haml :contact
  end

  get '/login' do
    haml :login
  end

  post '/contact' do
    ContactUs.new(params)
    redirect '/'
  end

  post '/login' do
    authenticate!
    if session[:user] == "admin"
      redirect '/admin_dashboard'
    else
      redirect '/login'
    end
  end

  get '/admin_dashboard' do
    login_helper(:admin_dashboard)
  end

  get '/logout' do
    session[:user] = nil
    redirect '/'
  end

  helpers do
    def authenticate!
      if params[:user] == "admin" && params[:password] == "password"
        session[:user] = "admin"
      end
    end

    def authenticated?
      session[:user] == "admin" ? true : false
    end

    def login_helper(address)
      if authenticated?
        haml address
      else
        redirect '/login'
      end
    end
  end
end
