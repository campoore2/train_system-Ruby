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

get('/admin/add_city_form') do
  erb(:success)
end
post('/admin/add_city_form') do
  city = params.fetch('add_city')
  line = params.fetch('add_line')
  arriv = params.fetch('add_arr')
  depar = params.fetch('add_depar')
  train = Train.new({:id => id, :line => line, :city => city,:depar => depar, :arriv => arriv})
  train.save()
  @train = Train.all()
  erb(:success)
end
get '/admin/add_line_form' do
  erb(:add_line_form)
end
