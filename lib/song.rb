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
=begin
  Song.new_by_filename
      file_name = 'Michael Jackson - Black or White - pop.mp3'
  This method will do four things
 It must parse a filename to find the song name and artist name.
 (Hint: every file separates the song and artist with a " - ").
 Now we put those values to use.
From here, we will create a new song instance using the string we gathered from the filename.
We'll also want to associate that new song with an artist. Use the artist attribute accessor to assign this
Return the new song instance.
=end

   def self.new_by_filename(filename)
    artist_song_genre = filename.split(" - ")
    name = artist_song_genre[1]
    song = self.new(name)
    song.artist_name =artist_song_genre[0]
    song
  end

  def artist_name=(name)
    a = Artist.find_or_create_by_name(name)
    a.add_song(self)
  end



end