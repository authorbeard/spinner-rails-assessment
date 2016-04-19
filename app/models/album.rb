class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :fans, class_name: "User"
  has_many :spins

end
