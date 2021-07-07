class Artist 
  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    @songs << song 
  end
  
  def print_songs
    @songs.each {|song| puts song.name}
  end
  
  
  #class methods
  
  def self.find_or_create_by_name(name)
    a = self.all.find{|artist| artist.name == name}
    a ? a : Artist.new(name)
  end
  
  def self.all
    @@all
  end

end 