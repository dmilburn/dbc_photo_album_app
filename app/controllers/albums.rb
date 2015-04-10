#albums routes

#show all
get '/albums' do
  @albums = Album.all
  erb :'/albums/index'
end

post '/albums' do
	redirect '/albums'
end

#show one album
get '/albums/:id' do |id|
  @album = Album.find(id)
  @photos = @album.photos
    puts @photos
    puts @photos.class
  erb :'albums/show'
end

#edit album

get '/albums/:id/edit' do |id|
  @album = album.find(id)
  erb :'albums/edit'
end

put '/albums/:id/edit' do |id|
  album = album.find(id)
  album.update(params[:album])
  redirect "/album/#{album.id}"
end

# delete an album
delete '/albums/:id/delete' do |id|
  album = Album.find(id)
  album.destroy
  redirect '/albums'
end
