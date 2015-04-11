# photo routes

require "base64"
require 'rubygems'
require 'sinatra'
require 'haml'

#Handle GET-request (Show the upload form)
get "/photos/upload" do
  if current_user
    haml :'photo/upload'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

#Handle POST-request (Receive and save the uploaded file)
post "/photos/upload" do
  upload_pic = File.open(params['upload_photo'][:tempfile], "rb").read
  new_photo = Photo.create(image: upload_pic,
                          name: params[:photo_name],
                          description: params[:description],
                          location: params[:location],
                          album_id: 1)
  redirect photo_url(new_photo)
end

get '/photos/:id' do |photo_id|
  if current_user
    @photo_object =  Photo.find(photo_id)
    photo_binary = @photo_object.image
    @photo = Base64.encode64(photo_binary)
    erb :'photo/show'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

#edit photo
get '/photos/:id/edit' do |id|
  if current_user
    @photo = Photo.find(id)
    @albums = Album.all
    erb :'photo/edit'
  else
    flash[:error] = "You do not have permission to see that. Please login."
    redirect '/login'
  end
end

put '/photos/:id/edit' do |id|
    photo = Photo.find(id)
    album = Album.find_by(name: @album_name)
    photo.update(params[:photo])
    redirect "/photos/#{photo.id}"
end

#delete a photo
delete '/photos/:id' do |id|
  photo = Photo.find(id)
  album = photo.album
  photo.destroy!
  redirect album_url(album)
  # "This will redirect to the delete photo's album"
  #redirect '../albums'
end
