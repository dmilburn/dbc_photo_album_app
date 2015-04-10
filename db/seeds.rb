# MyTableObject.create(
#     :name => "Test",
#     :image => File.open("PathToMyFile.jpg", 'rb').read
# )

User.create(name: "email", password: "monkey")

Album.create(name: "Awesome", user_id: 1)

read_picture = File.open("/Users/charles/Desktop/borat.jpg", 'rb').read

Photo.create(image: read_picture, album_id: 1)
