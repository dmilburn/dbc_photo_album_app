# MyTableObject.create(
#     :name => "Test",
#     :image => File.open("PathToMyFile.jpg", 'rb').read
# )

User.create(name: "email", password: "monkey")
User.create(name: "dieselroar", password: "carpediem")

Album.create(name: "Travel", user_id: 1)

Album.create(name: "Family", user_id: 1)
Album.create(name: "Selfies", user_id: 1)
Album.create(name: "Times I fell", user_id: 1)

read_picture = File.open("/Users/charles/Desktop/borat.jpg", 'rb').read

Photo.create(image: read_picture, album_id: 1)

