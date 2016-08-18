get '/' do 
	erb :"/index"
end
#sessions new
get '/sessions/new' do 
  erb :"sessions/new", :layout => !request.xhr?
end
#sessions create
post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user
    if @user.authenticate?(params[:password])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = "Invalid login information. Please try again."
      redirect '/sessions/new'
    end
  else
    @error = "You are not registered. Please register."
    redirect '/sessions/new'
  end
end

#session delete
  delete '/sessions/:id' do 
    session[:id] = nil 
    redirect '/'
  end 