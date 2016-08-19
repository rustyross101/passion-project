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
	erb :'/users/generate'
end

#users show
get '/users/:id' do 
	@user = User.find(params[:id])
	erb :'users/show'
end



#######################################################################################################################

# #users index
# get '/users/index' do 
# 	@users = User.all
# 	erb :'users/index'
# end




# #users edit
# get '/users/:id/edit' do 
# 	@user = User.find(params[:id])
# 	erb :'users/edit'
# end

# #users create
# post '/users' do 
# 	@user = User.find(params[:id])
# 	if @user.save
# 		session[:id] = @user.id
# 		redirect "/users/#{@user.id}"
# 	else
# 		@errors = users.errors.full_messages
# 	erb :'users/new'
# 	end
# end

# #users update
# put '/users/:id' do 
# 	@user = User.find(params[:id])
# 	@user.update(params[:user])
# 	redirect '/users/#{@user.id}'
# end

# #users delete
# delete '/users/:id' do 
# 	@user = User.find(params[:id])
# 	@user.destroy
# 	redirect '/users'
# end