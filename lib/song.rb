require 'pry'
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

    def self.new_by_filename(file)
      # binding.pry
      song_name = file.split(" - ")[1]
      artistname = file.split(" - ")[0]
      song = Song.new(song_name)
      artist = Artist.new(artistname)
      song.artist = artist
      song
    end
    
    def artist_name=(name)
      artist = Artist.find_or_create_by_name(name)
      self.artist = artist
    end
    
    def save
      @@all << self
      self
    end
  end
  
  
  










  
  
  
  # song_name = file.name.split(" - ")[1]
  # artist_name = file.name.split(" - ")[0]
  # song = self.new(song_name)
  # song.artist_name = artist_name
  # song
  
  # self.artist= Artist.find_or_create_by_name(name)
  # self.artist.add_song(self)





# class Song
#   attr_accessor :name, :artist
#   @@all = []

#   def initialize(name)
#     @name = name
#     save
#   end

#   def save
#     @@all << self
#   end

#   def self.all
#     @@all
#   end

#   def self.new_by_filename(filename)
#     artist, song = filename.split(" - ")
#     new_song = self.new(song)
#     new_song.artist_name = artist
#     new_song
#   end

#   def artist_name=(name)
#     self.artist = Artist.find_or_create_by_name(name)
#     artist.add_song(self)
#   end
# end
