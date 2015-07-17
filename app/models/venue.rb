class Venue < ActiveRecord::Base
  has_many :arts

  def self.get_and_pop()
    @venues = Venue.all
  end
end
