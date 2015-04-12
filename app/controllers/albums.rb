#albums routes
enable :sessions

#show all
get '/users/:id/albums' do |id|
  if !current_user || id != current_user.id.to_s
    @albums = Album.where(user_id: id, public: true)
  else
    @albums = Album.where(user_id: id)
  end
  # permission_check
  @photos = Photo.all
  erb :'/albums/index'
end



#create album
get '/albums/new' do
  permission_check
  erb :'/albums/new'
end

post '/albums' do
  album = Album.create(params[:album])
  if album.valid?
    redirect album_url(album)
  else
    flash[:error] = "Album could not save without a title. Please try again."
    redirect "/albums/new"
  end
end

#show one album
get '/albums/:id' do |id|
  permission_check
  @album = Album.find(id)
  album_ownership_check(@album)
  @photos = @album.photos
  erb :'albums/show'
end

#edit album

get '/albums/:id/edit' do |id|
  permission_check
  @album = Album.find(id)
  album_ownership_check(@album)
  erb :'albums/edit'
end

put '/albums/:id' do |id|
  album = Album.find(id)
  begin
  album.update!(params[:album])
  rescue
    flash[:error] = "Album update didn't save. Please try again."
    redirect album_url(album) + "/edit"
  end
  redirect album_url(album)
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
