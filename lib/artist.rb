class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def add_song(song)
    song.artist = self
  end
 
  def self.find_or_create_by_name(name)
    if all.each do |name| name == name 
      return name 
    end
    end
      self.new(name)
    end
  
  def print_songs
    songs.each do |song| song.name 
    puts song.name
  end
  end
  
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def self.all 
    @@all 
  end
  
end 