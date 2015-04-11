class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  validates :user_id, :name, presence: true

end
