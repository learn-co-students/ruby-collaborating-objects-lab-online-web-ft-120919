require 'pry'
class Artist 
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name #artist
    save
  end
    def save
      @@all << self
    end 
  def self.all 
    @@all
  end 
  def songs 
    Song.all.select {|song| song.artist == self }
  end 
  def add_song(song)
    song.artist = self 
  end 
  def self.find_or_create_by_name(name)
    binding.pry
    if @@all.include? (self.name) #If the all array includes the name of the artist in question
      p self.name #print the name of the artist 
    else 
      self.new(name) #create a new instance with the given name 
    end 
      
      
  
  end 
  
end 