get '/user/:id' do |id|
  @albums = Album.where(user_id: id, public: true)
  @photos = Photo.all
  erb :'/albums/index'
end
