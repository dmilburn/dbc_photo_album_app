#albums routes
enable :sessions

#show all
get '/albums' do
  @albums = Album.all
  erb :'/albums/index'
end

#create album
get '/albums/new' do
  erb :'/albums/new'
end

post '/albums' do
  album = Album.create(params[:album])
  redirect album_url(album)
end

#show one album
get '/albums/:id' do |id|
  @album = Album.find(id)
  @photos = @album.photos
  erb :'albums/show'
end

#edit album

get '/albums/:id/edit' do |id|
  @album = Album.find(id)
  erb :'albums/edit'
end

put '/albums/:id' do |id|
  album = Album.find(id)
  album.update(params[:album])
  redirect "#{album_url(album)}"
end

# delete an album
delete '/albums/:id/delete' do |id|
  album = Album.find(id)
  album.destroy
  redirect '/albums'
end
