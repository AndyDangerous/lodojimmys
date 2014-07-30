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

  get '/menu/#{:menu_number}' do
    haml :menu, locals: {menu_number: menu_number}
  end

  get '/menu_2' do
    haml :menu_2
  end

  get '/admin' do
    haml :admin
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
    ContactUs.new(params[:contact])
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

  get '/edit_brunch_menu' do
    login_helper(:admin_menu_4)
  end

  get '/edit_regular_menu' do
    login_helper(:admin_menu_3)
  end

  get '/logout' do
    session[:user] = nil
    redirect '/'
  end

  get '/edit/:item_id' do |item_id|
    #currently skipping authentication for testing
    haml :form, locals: {item_id: item_id}
  end

  # put '/:menu_item_id' do
  #   MenuDB.new
  # end

  # get '/edit/:id' do |id|
  #   idea = IdeaStore.find(id.to_i)
  #   erb :edit, locals: {id: id, idea: idea}
  # end


  helpers do
    def authenticate!
      if params[:user] == "admin" && params[:password] == "password"
        session[:user] = "admin"
      end
    end

    def authenticated?
      session[:user] == "admin" ? true : false
    end

    def login_helper(address, item_id = nil)
      if authenticated?
        haml address
      #   if item_id
      #     haml address locals: {item_id: item_id}
      #   else
      #     haml address
      #   end
      else
        redirect '/login'
      end
    end
  end
end
