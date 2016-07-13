require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "./lib/train"
require "./lib/rider"

get '/' do
  erb :index
end
get '/rider' do
  erb :rider
end
get '/admin' do
  erb :admin
end

post('/where') do
  @loc = params.fetch('loc')
  erb(:index)
end
