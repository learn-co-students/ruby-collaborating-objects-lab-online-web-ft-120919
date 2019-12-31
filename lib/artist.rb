class Artist 
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  def Artist.all
    @@all
  end 
  
  def add_song(song)
    @songs << song 
  end 
  
  def songs
    @songs 
  end 
  
  def find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else 
      self.create(name)
    end 
  end 
  
  def self.find(name
    @all.find do |artist|
      artist.name == name
    end 
  end 
  
    
end 