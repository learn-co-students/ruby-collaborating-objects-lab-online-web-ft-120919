# The Artist class will be responsible for either creating 
# the artist (if the artist doesn't exist in our program yet) 
# or finding the instance of that artist (if the artist does 
# exist).
#Song relies on the Artist instances to build associations

class Artist

    attr_accessor :name, :songs

    @@all = [] #class variable storing all Artist instances

    def initialize(name)
        @name = name 
        save
        # @songs = [] #song instances from Song
    end

    def add_song(song) #get song instances from Song and associate it belongs to this Artist instance
        # @songs << song
        song.artist = self
        # This instance method receives an instance of a Song and associates it belongs 
        #to this Artist instance.
    end


    def songs #this is wrong
        #This instance method returns an Array of all songs that belong to this Artist 
        # instance. This method should get all existing Song instances from Song and 
        # select only the ones that are associated with this Artist instance.
        # @songs
        Song.all.select {|song| song.artist == self}
    end

    def save
        @@all << self #self is instance of Artist (in this case b/c it's inside of an instance method)
    end

    def self.all #class method 
        @@all
    end 

    def self.find_or_create_by_name(name)   #class method uses find/create class 
        #methods to detect or create instances
        if self.find(name)
            self.find(name)
        else
            self.create(name)
        end
        # @@all.find do |artist| 
        #     if artist.name == name
        #         artist
        #     else
        #         new_artist = Artist.new(name)
        #     end
        # end
    end

    def self.find(name)     #class method detects instances from @@all class variable
        self.all.detect { |artist| artist.name == name }
    end

    def self.create(name)   #class method creates & stores instances vs initializing
        artist = Artist.new(name)
        artist
    end

    def print_songs #instance method iterates through @songs of an instance of Artist
        self.songs.each {|song| puts song.name}
    end


end
