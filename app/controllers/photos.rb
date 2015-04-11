# photo routes

require "base64"
require 'rubygems'
require 'sinatra'
require 'haml'

#Handle GET-request (Show the upload form)
get "/photos/upload" do
  haml :'photo/upload'
end

#Handle POST-request (Receive and save the uploaded file)
post "/photos/upload" do
  upload_pic = File.open(params['upload_photo'][:tempfile], "rb").read
  new_photo = Photo.create(image: upload_pic,
                          name: params[:photo_name],
                          description: params[:description],
                          location: params[:location],
                          album_id: 1)
  redirect "/photos/#{new_photo.id}"
end

get '/photos/:id' do |photo_id|
  @photo_object =  Photo.find(photo_id)
  photo_binary = @photo_object.image
  @photo = Base64.encode64(photo_binary)
  erb :'photo/show'
end

# show all photos
get '/photos/' do
  "show all photos"
end

#edit photo
get '/photos/:id/edit' do |id|
  @photo = Photo.find(id)
  erb :'photo/edit'
end

put '/photos/:id/edit' do |id|
  photo = Photo.find(id)
  photo.update(params[:photo])
  puts params[:photo]
  redirect "/photos/#{photo.id}"
end

#delete a photo
delete '/photos/:id' do |id|
  photo = Photo.find(id)
  photo.destroy
  "This will redirect to the delete photo's album"
  #redirect '../albums'
end
