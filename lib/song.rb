# # The Song class will be responsible for creating songs 
# # given each filename and sending the artist's name 
# # (a string) to the Artist class
# #relies on Song in order to do its job of parsing filenames.

require 'pry'


class Song
    attr_accessor :artist, :name

    @@all = []
  
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

    def self.new_by_filename(file)

        song_info = file.chomp(".mp3").split(" - ")
        song = Song.new(song_info[1]) #this creates a new instance of a song from the file that is passed
        song.artist_name = song_info[0]
        song

        # song_info = file.chomp(".mp3").split(" - ")
        # song = Song.new(song_info[0]) #this associated new song instance wiht the artist from the filename
        # song.artist_name = song_info[1] 
        # song
    

        # song_info = file.chomp(".mp3").split(" - ")
        # song_name = song_info[1]
        # @artist = song_info[0]
        # Song.new(song_name) 
        # artist_name=(@artist)

        # artist_name = file.split(" - ")[0]
        # song_name = file.split(" - ")[1]
        # song = Song.new(song_name)
        # song.artist_name = artist_name
        # song

    end

    def artist_name=(artist_name)
    # finds or creates an Artist instance and assigns it to the Song's artist attribute

        # self.artist = Artist.find_or_create_by_name(artist_name) #would this this would be the solution
        
        # if self.artist.nil? 
        #     self.artist = Artist.new(name)
        #     # self.artist_name = name
        # else
        
        # end

        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
        artist.add_song(self)
      
    end

end
