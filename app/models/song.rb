class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def artist_name=(name)

    if self.artist
      self.artist.name = name
    else
      artist = Artist.find_or_create_by(name: name)
      artist.songs << self
    end

  end
  
end
