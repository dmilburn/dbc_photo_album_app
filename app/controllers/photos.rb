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
  new_photo = Photo.create(image: upload_pic, album_id: 1)
  redirect "/photos/#{new_photo.id}"
end

get '/photos/:id' do |photo_id|
  photo_binary = Photo.find(photo_id).image
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
