require "sinatra"
require "sinatra/reloader"
require "pg"
also_reload "lib/**/*.rb"
require "./lib/train"
require "./lib/rider"
require "pry"

DB = PG.connect({:dbname => "train_system"})

get '/' do
  erb :index
end
get '/rider' do
  erb :rider
end
get '/admin' do
  erb :admin
end

get('/admin/add_city_form') do
  erb(:add_city_form)
end

post('/add_city_form') do
  city = params.fetch('add_city')
  line = params.fetch('add_line')
  arriv = params.fetch('arr')
  depar = params.fetch('dep')
  train = Train.new({:line => line, :city => city,:depar => depar, :arriv => arriv})
  binding.pry
  train.save()
  @trains = Train.all()
  erb(:admin)
end
