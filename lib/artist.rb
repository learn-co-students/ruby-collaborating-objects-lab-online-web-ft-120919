class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    return @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

=begin
  This class method should take the name that is passed in
 (remember, it will be a string), and do one of two things.
 Find the artist instance that has that name or create one if it doesn't exist.
=end

  def self.find_or_create_by_name(name)
    artist=nil
    Artist.all.each do |a|
      if a.name == name
        artist=a
      end
    end

    if (artist.nil?)
      artist = Artist.new(name)
    end
    return artist
  end

  def print_songs
    Song.all.each do |s|
      if s.artist == self
        puts s.name
      end
    end
  end

end