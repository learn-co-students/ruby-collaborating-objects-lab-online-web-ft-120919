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

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)  
  end 
  
  def self.new_by_filename(filename)
    #Assumes format "Artist - Name - Genre.mp3"
    artist_name, song_name, genre = filename.split(" - ")
    song = self.new(song_name)
    song.artist_name = artist_name
    song 
  end 
  
end 