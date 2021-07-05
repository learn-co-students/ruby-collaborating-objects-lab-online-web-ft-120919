require "pry"

class MP3Importer
  attr_accessor :path, :file_names
  
  def initialize(path)
    @path = path 
   
  end
  
  def files
    @file_names = Dir.entries(@path)
    @file_names.select do |file| 
      file.include?(".mp3")
    end
  end 
  
  def import
    files.each{ |filename| Song.new_by_filename(filename) }
  end
end