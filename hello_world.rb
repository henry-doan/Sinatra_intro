require 'sinatra'
require 'pry'
require 'babbler'

#DSL - Domain specific language

# Root URL
get '/' do
	"Hello World!"
end

get '/hello' do
	'Hello'
end

#Params is just a ruby hash
get '/hello/:name' do
	"Hello #{params['name']}!"
end

# URL Parameters
get '/hello/:name/:age' do
	age = params[:age].to_i + 10
	"#{params[:name]} age is now: #{age}"
end

# Query String Parameters
get '/sport' do
	name = params[:name]
	if params[:favorite] == 'snowboarding'
		"You are awesome #{name}"
	else
		"blah #{name}"
	end
end

#Query String
# http://localhost:4567/sport?favorite=snowboarding&name=Henry

get '/secret' do
	erb :secret
end

get '/zoo' do
	@animals = ['Hippo', 'Penguin', 'Lion','Tiger','Bunny']
	@name = 'Henry Doan'
	#ERB always does the last line
	erb :zoo
end

get '/numbers' do
	@numbers = [1,2,3,4,5,6,7,8,9,10]
	erb :numbers
end

post '/secret' do
	params[:message].reverse
end


#error pages
not_found do
	status 404
	'not found'
end









