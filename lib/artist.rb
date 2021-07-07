require 'pry'
class Artist 
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def songs
    Song.all.select do |song|
    song.artist == self 
    end 
  end 
    
  
 def add_song(song)
   song.artist = self 
 end 
  
  def save 
    @@all << self 
    self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.find_or_create_by_name(name)
    self.all.find {|artist| artist.name == name} || Artist.new(name)
    end 
    
  def print_songs
    songs.each do |song|
      puts song.name 
    end 
  end 
  
end 