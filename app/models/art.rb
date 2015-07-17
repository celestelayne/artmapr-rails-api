class Art < ActiveRecord::Base

  require 'open-uri'
  require 'json'

  belongs_to :venues

  def as_json(options={})
    super(:only => [:title, :artist, :medium],
          :include => {
            :venues => {:only => [:name]}
          }
    )
  end

  def self.get_json
    source = "https://data.sfgov.org/resource/zfw6-95su.json?$select=artist, location_1, created_at, title, geometry, medium&$limit=50"
    # file = File.read(source)
    @artjson = JSON.load(open(source).read)
    # response = RestClient.get 'https://www.kimonolabs.com/api/485d0k46?apikey=RG2ieKWJA4h3SOEFe9aVdTORGEFJa7ic'
  end

end
