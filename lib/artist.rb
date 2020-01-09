class Artist 
  attr_accessor :name, :song
  @@all = []
  
  def initialize(name)
    @name = name
    # @songs = []
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    find_artist = @@all.find {|artist| artist.name == name}
    if find_artist
      find_artist
    else
      self.new(name)
    end
  end
  
  def print_songs
    self.songs.each {|p| puts p.name}
  end
end