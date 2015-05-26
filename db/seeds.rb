# MyTableObject.create(
#     :name => "Test",
#     :image => File.open("PathToMyFile.jpg", 'rb').read
# )

User.create(name: "email", password: "monkey")

Album.create(name: "Travel", user_id: 1, public: true)

picture_1 = File.open("/Users/deborahmilburn/Pictures/Face Pots.jpg", 'rb').read

Photo.create(image: picture_1, album_id: 1)

