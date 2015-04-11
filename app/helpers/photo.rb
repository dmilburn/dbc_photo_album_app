def encode(photo)
	Base64.encode64(photo.image)
end

def photo_url(photo)
	"/photos/#{photo.id}"
end