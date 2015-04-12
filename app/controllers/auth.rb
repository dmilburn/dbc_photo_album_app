enable :sessions


get '/' do
  if current_user
    redirect '/albums'
  else
    redirect '/login'
  end
end

get '/login' do
  if current_user
    redirect '/users/#{current_user.id}/albums'
  else
    erb :'auth/login'
  end
end

post '/login' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/users/#{current_user.id}/albums'
  else
    flash[:error] = "Could not find your account. Please try again."
    redirect '/login'
  end
end

get '/signup' do
  if current_user
    redirect '/albums'
  else
    erb :'auth/signup'
  end
end

post '/signup' do
  user = User.new(params[:user])
  if params[:user][:name] == "" || params[:user][:password] == "" || params[:user][:password_confirmation] == ""
    flash[:error] = "You need a username and a password to sign up. Please try again."
  elsif params[:user][:password] != params[:user][:password_confirmation]
    flash[:error] = "Your passwords didn't match. Please try again."
  elsif !user.valid?
    flash[:error] = "That username has already been chosen. Please try again."
  else
    user.save
    session[:user_id] = user.id
    redirect '/users/#{current_user.id}/albums'
  end
  redirect '/signup'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
