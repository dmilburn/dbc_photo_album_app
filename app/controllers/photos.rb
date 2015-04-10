# photo routes

# show all photos
get '/photos' do
  "show all photos"
end


#add photo to album
get '/photos/new' do
  "new photo"
end

post '/photos/new' do
  # validations for new photo creation
end

# show one photo
get '/photos/:id' do |id|
  "show one photo"
end

#edit photo
get '/photos/:id/edit' do |id|
  @photo = Photo.find(id)
  erb :'photos/edit'
end

put '/photos/:id/edit' do |id|
  photo = Photo.find(id)
  photo.update(params[:photo])
  redirect "/photo/#{album.id}"
end

#delete a photo

delete '/photos/:id/delete' do |id|
  photo = Photo.find(id)
  photo.destroy
  redirect '../albums'
end
