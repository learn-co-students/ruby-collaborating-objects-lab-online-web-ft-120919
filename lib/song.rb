require "pry"
class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    artist,song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
    #binding.pry
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    #binding.pry
    artist.add_song(self)
  end
end
# describe '.new_by_filename' do
#     it 'creates a new instance of a song from the file that\'s passed' do
#       file_name = 'Michael Jackson - Black or White - pop.mp3'
#       new_instance = Song.new_by_filename(file_name)
#       expect(new_instance.name).to eq('Black or White')
#     end