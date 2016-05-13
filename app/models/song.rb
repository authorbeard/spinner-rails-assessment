class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :album
  has_many :fans, through: :albums

  validates :title, uniqueness: { scope: :album_id,
  message: "You got that one already." }
  before_create :prep_title

  def prep_title
    title.capitalize!
  end
end
