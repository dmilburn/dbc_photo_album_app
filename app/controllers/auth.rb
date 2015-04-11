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
    redirect '/albums'
  else
    erb :'auth/login'
  end
end

post '/login' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/albums'
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
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
    redirect '/albums'
  else
    flash[:error] = "Could not create your account. Please try again."
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
