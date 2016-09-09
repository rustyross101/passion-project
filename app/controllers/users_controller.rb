#users new
get '/users/new' do 
	erb :'/users/new'
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save
		session[:id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :'/users/new'
	end
end

get '/users/generate' do 
	@planet = get_planet["results"].sample
	@species = get_species["results"].sample
	@starship = get_starship["results"].sample
	if request.xhr?
		erb :'/users/_generate', locals: {planet: @planet, species: @species, starship: @starship}, layout: false
	else
		erb :'/users/generate'
	end	
end

#users show
get '/users/:id' do 
	@user = User.find(params[:id])
	erb :'users/show'
end

