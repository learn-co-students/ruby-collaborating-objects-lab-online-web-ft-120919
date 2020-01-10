class Song
  attr_accessor :artist, :name
 
  @@all = []
 
  def initialize(name)
    @name = name
    save
  end
 
  def self.new_by_filename(filename)
    name = filename.split(" - ")[1]
    song = self.new(name)
    song_artist = filename.split(" - ")[0]
    song.artist_name=(song_artist)
    song
  end
  
  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.find_or_create_by_name(name)
    else
      self.artist.name = name
    end
  end
  
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
end