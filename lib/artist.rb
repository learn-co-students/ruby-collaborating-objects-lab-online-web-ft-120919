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

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def self.find(name)
    self.all.detect {|artist| artist.name == name}
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    self.all.find { |artist| artist.name == name } || self.new(name)
    # if self.find(name)
    #   self.find(name)
    # else
    # self.create(name)
    # end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end
