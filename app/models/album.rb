class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  validates :user_id, :name, presence: true

  def show_albums
    albums = Album.all
    albums.each do |album|
    	
    end
  end

end
