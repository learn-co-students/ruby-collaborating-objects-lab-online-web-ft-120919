# frozen_string_literal: true

# Song creation and artist assoc
class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  # after the artist instance is returned
  # this method calls the artist instance method #add_song
  # add_song adds this current song instance to the artist's song list

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end
  # accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
