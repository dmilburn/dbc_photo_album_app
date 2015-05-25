require "base64"

get "/photos/upload" do
  if current_user
    @albums = Album.where(user_id: current_user.id)
    erb :'photos/upload'
  else
    flash[:error] = "Please create an account to upload a photo."
    redirect '/signup'
  end
end

post "/photos/upload" do
  begin
    upload_pic = File.open(params['upload_photo'][:tempfile], "rb").read
    photo_album = Album.find_by(name: params['album_name'])
    new_photo = Photo.create(image: upload_pic,
                            name: params[:photo_name],
                            description: params[:description],
                            location: params[:location],
                            album_id: photo_album.id)
    redirect album_url(new_photo.album)
  rescue
    flash[:error] = "Photo could not save. Please try again."
    redirect 'photos/upload'
  end
end

get '/photos/:id' do |photo_id|
  @photo_object =  Photo.find(photo_id)
  privacy_guard(@photo_object.album)
  photo_binary = @photo_object.image
  @photo = Base64.encode64(photo_binary)
  erb :'photos/show'
end

get '/photos/:id/edit' do |id|
  @photo = Photo.find(id)
  album_owner_guard(@photo.album)
  @albums = Album.where(user_id: current_user.id)
  erb :'photos/edit'
end

put '/photos/:id/edit' do |id|
  photo = Photo.find(id)
  photo.update(params[:photo])
  redirect album_url(photo.album)
end

delete '/photos/:id' do |id|
  photo = Photo.find(id)
  album = photo.album
  photo.destroy!
  redirect album_url(album)
end
