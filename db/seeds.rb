# MyTableObject.create(
#     :name => "Test",
#     :image => File.open("PathToMyFile.jpg", 'rb').read
# )

User.create(name: "email", password: "monkey")
User.create(name: "dieselroar", password: "carpediem")

Album.create(name: "Travel", user_id: 1)

Album.create(name: "Family", user_id: 1)
Album.create(name: "Selfies", user_id: 1)

picture_1 = File.open("/Users/charles/Desktop/borat.jpg", 'rb').read
picture_2 = File.open("/Users/charles/Desktop/H2H.jpg", 'rb').read  
# picture_3 = File.open("/Users/charles/Desktop/borat.jpg", 'rb').read
# picture_4 = File.open("/Users/charles/Desktop/H2H.jpg", 'rb').read

Photo.create(image: picture_1, album_id: 1)

Photo.create(image: picture_2, album_id: 1)
