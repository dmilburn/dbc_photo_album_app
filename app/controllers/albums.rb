#albums routes

#show all
get '/albums' do
  "show all albums"
end

post '/albums' do
	redirect '/albums'
end

#show one album
get '/albums/:id' do |id|
  "show an album"
end

#edit albumgit p

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
