class Photo < ActiveRecord::Base
  belongs_to :album
  before_validation(on: :create) do 
  	set_name	
  end
  validates :album_id, :image, presence: true

  def set_name
  	self.name = "img" if !attribute_present?("name")
  end

end
