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
    redirect '/login'
  end
end

get '/signup' do

end
