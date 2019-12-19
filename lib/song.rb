require 'pry'
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
  
  def self.new_by_filename(filename)
    # binding.pry
    s = self.new(filename.split(' - ')[1])
    s.artist_name = filename.split(' - ')[0]
    s
  end
  
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    # binding.pry
  end


end 