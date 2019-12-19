require 'pry'

class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    # save
  end
  
  def save 
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_song(song)
    song.artist = self
  end 
  
  def songs 
    Song.all.select { |s| s.artist == self}
  end
  
  def self.create_by_name(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist.name = artist_name
    artist
  end

  def self.find_by_name(artist_name)
    self.all.detect{|a| a.name == artist_name}
  end

  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.create_by_name(artist_name)
  end
  
  def print_songs
    Song.all.select do |s| 
      puts s.name if s.artist == self
    end
  end
  
end