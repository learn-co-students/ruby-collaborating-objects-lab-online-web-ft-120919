# frozen_string_literal: true

# Artist/Song creation,finding,saving
class Artist
  attr_accessor :name

  @@all = [] # empty array to be populated

  def initialize(name)
    @name = name
    @@all << self # populating array at initiliaze.
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def add_song_by_name(name)
    Song.new(name).artist = self # creating new song by name w/ assoc to artist
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find { |artist| artist.name == artist_name }
    if found_artist
      found_artist
    else
      new_artist = self.new(artist_name)
      new_artist.save
      new_artist
    end
  end

  def save
    @@all << self
  end

  def print_songs
    songs.each { |song| puts song.name } # print each song in array songs
  end
end
