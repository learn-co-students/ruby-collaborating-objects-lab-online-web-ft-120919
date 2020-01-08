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
  def self.find_or_create_by_name(name) #look into Artist class to see if artist exist, and if not, creates one
   found_artist = @@all.detect {|artist| artist.name == name} #or .find
    if found_artist
      found_artist
    else 
      self.new(name) #create a new instance with the given name 
    end 
      
      
  
  end 
  def print_songs
       self.songs.each do |song| puts song.name end 
      end 
end 