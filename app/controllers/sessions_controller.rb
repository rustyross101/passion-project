get '/' do 
	erb :"aliens/new"
end

get '/sessions/new' do 
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  if @user
    if @user.authenticate?(params[:email][:password])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = "Invalid login information. Please try again."
      redirect '/sessions/new'
    end
  else
    @error = "You are not registered. Please register."
    redirect "/sessions/new"
  end
end