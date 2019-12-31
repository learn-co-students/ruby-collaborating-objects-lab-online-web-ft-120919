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
  
  def self.find_or_create_by_name(name)
    my_artist = all.detect{|artist| artist.name == name}
    if my_artist
      return my_artist
    else 
      return self.new(name)
    end 
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end 
  
  def add_song(song)
    song.artist = self 
  end 
  
  def print_songs 
    self.songs.each do |song|
      puts song.name 
    end 
  end 
end 