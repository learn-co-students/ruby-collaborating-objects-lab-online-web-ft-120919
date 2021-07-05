class Artist

  attr_accessor :name
  @@all = [] #Keeps track of all Artist instances

  def initialize(name)
    @name = name 
    @songs = []
    @@all << self
  end #init

  def self.all
    @@all 
  end #self.all

  def songs
    Song.all.select{|song| song.artist == self}
  end #songs

  def add_song(song)
    #binding.pry 
    song.artist = self 
    #song.save 
    @songs << song  
  end #add_song

  def self.find_or_create_by_name(artist_name)
    all_names = self.all.collect{|artist| artist.name}
    if !all_names.include?(artist_name)
      Artist.new(artist_name)
    else
      self.all.find{|artist| artist.name == artist_name}
    end #if
  end #find_or_create_by_name

  def print_songs
    songs.each do |song|
      puts song.name 
    end #each
  end #print_songs

end #class