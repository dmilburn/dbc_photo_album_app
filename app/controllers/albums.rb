#albums routes
enable :sessions

get '/' do
  albums = Album.where(public: true)
  @photos = []
  albums.each do |album|
    album.photos.each do |photo|
      @photos << photo
    end
  end
  @photos.shuffle!
  erb :'index'
end



#show all of a user's albums
get '/users/:id/albums' do |id|
  user = User.find(id)
  if current_user && current_user.id == user.id
    @albums = user.albums
  else
    @albums = user.albums.where(public: true)
  end
  erb :'/albums/index'
end


#create album
get '/albums/new' do
  if current_user
    erb :'/albums/new'
  else
    flash[:error] = "Please create an account to make a new album."
    redirect '/signup'
  end
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
  @album = Album.find(id)
  privacy_guard(@album)
  @photos = @album.photos
  erb :'albums/show'
end

#edit album

get '/albums/:id/edit' do |id|
  @album = Album.find(id)
  album_owner_guard(@album)
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
  redirect '/'
end
