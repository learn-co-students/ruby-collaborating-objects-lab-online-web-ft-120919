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
    file = file_name.split(" - ")
    new_song = Song.new(file[1])
    new_artist = Artist.new(file[0])
    new_song.artist = new_artist
    new_song
  end
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    self.artist.add_song(self)
    # binding.pry
  end

end
