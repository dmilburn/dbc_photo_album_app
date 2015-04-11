#albums routes
enable :sessions

#show all
get '/albums' do
  if current_user
    @albums = Album.all
    erb :'/albums/index'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

#create album
get '/albums/new' do
  if current_user
    erb :'/albums/new'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

post '/albums' do
  album = Album.create(params[:album])
  redirect album_url(album)
end

#show one album
get '/albums/:id' do |id|
  if current_user
    @album = Album.find(id)
    @photos = @album.photos
    erb :'albums/show'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

#edit album

get '/albums/:id/edit' do |id|
  if current_user
    @album = Album.find(id)
    erb :'albums/edit'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

put '/albums/:id' do |id|
  album = Album.find(id)
  album.update(params[:album])
  redirect "#{album_url(album)}"
end


# delete an album
delete '/albums/:id/delete' do |id|
  album = Album.find(id)
  photos = album.photos
  album.destroy
  photos.each do |photo|
    photo.destroy
  end
  redirect '/albums'
end
