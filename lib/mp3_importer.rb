class MP3Importer
  
  attr_accessor :path, :library
  
  def initialize(file_path)
    @path = file_path
    @library = []
  end
  
  def files
    Dir.children(@path)
  end
  
  def import 
    self.files.each do |file_name|
      new_song = Song.new_by_filename(file_name)
      @library << new_song
    end
  end
  
end