class MP3Importer#utility class 
    attr_accessor :path, :files #2nd priority to `def` 
  def initialize(path)
    @files = []
    @path = path
    
  end
  
  def files
    Dir["#{path}/*.mp3"].each do |file| @files << file.sub("#{path}/","")end 
    @files 
  end
  def import 
    files.each do |file|
    Song.new_by_filename(file) end 
  end 
end