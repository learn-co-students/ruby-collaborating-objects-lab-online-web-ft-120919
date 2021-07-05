class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name 
    save
  end #name

  def artist_name=(a_name)
    all_artists = Artist.all 
    all_names = all_artists.collect{|artist| artist.name}
    if all_names.include?(a_name)
      the_artist = all_artists.find{|artist| artist.name == a_name}
      self.artist = the_artist  
    else
      the_artist = Artist.new(a_name)
      self.artist = the_artist 
    end #if
  end #artist_name

  def self.new_by_filename(file_name)
    song_info = file_name.split(" - ")
    song_name = song_info[1]
    song_artist = song_info[0]
    #binding.pry
    s = self.new(song_name)
    s.artist_name=(song_artist)
    #binding.pry 
    s 
  end #new_by_filename

  def save
    @@all << self 
  end #save

  def self.all 
    @@all 
  end #all


end #class 