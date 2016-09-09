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
      puts "INSIDE THE ELSE, should display invalid login."
      @error = "Invalid login information. Please try again."
      redirect '/sessions/new'
    end
  else
  puts "INSIDE THE OUTTER ELSE, should display not registered."

    @error = "You are not registered. Please register."
    redirect '/sessions/new'
  end
end

#session delete
  delete '/sessions/:id' do 
    session[:id] = nil 
    redirect '/'
  end 