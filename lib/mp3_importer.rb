class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path 
  end #init

  def files
    all_files = Dir.entries(@path)
    all_files.delete_at(0)
    all_files.delete_at(0)
    #binding.pry
    all_files 
  end #files

  def import 
    #files returns an array of strings
    #I want to iterate over that array
    #For each string, turn it into an array
    #Pull off the 0-index element and make a song out of it
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end #each
  end #import

end #class