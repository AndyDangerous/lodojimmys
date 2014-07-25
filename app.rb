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

  post '/' do
    IdeaBuilder.build(params[:idea])
    redirect '/'
  end
end
