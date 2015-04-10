class Photo < ActiveRecord::Base
  belongs_to :album
  validates :album_id, :image, presence: true

end
