require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    contents = filename.split(" - ")
    artist = contents [0]
    songname = contents[1]

    s = Song.new(songname)

    s.artist = Artist.find_or_create_by_name(artist)
    s
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)

  end
end
