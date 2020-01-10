class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file_name)
    data = file_name.split(" - ")
    song = self.new(data[1])
    song.artist_name = data[0]
    song
  end
  
  def artist_name=(name_string)
    artist = Artist.find_or_create_by_name(name_string)
    @artist = artist
    artist.add_song(self)
  end
  
end