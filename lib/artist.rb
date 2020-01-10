class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
  end
  
  def self.find_or_create_by_name(name)
    result = self.all.find {|artist| artist.name == name}
    if result == nil
      self.new(name)
    else
      result
    end
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end
  
end