class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Cannot be repeated by the same artist in the same year"}

  validates :released, inclusion: { in: [true, false]}
  with_options if: release do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numerically: { less_than_or_equal_to: Date.today.year}
  end
  validates :artist_name, presence: true
 end 
end
