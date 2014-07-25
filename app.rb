require 'bundler'
require 'haml'
Bundler.require

class JimmysApp < Sinatra::Base
  set :method_override, true
  # set :root, 'lib/app'
  set :public_folder, 'public'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    haml :error
  end

  get '/' do
    haml :index #, locals: {ideas: IdeaStore.all.sort, idea: Idea.new}
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
end
