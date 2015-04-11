enable :sessions


get '/' do
  redirect '/login'
end

get '/login' do
  erb :'auth/login'
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
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/albums'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
