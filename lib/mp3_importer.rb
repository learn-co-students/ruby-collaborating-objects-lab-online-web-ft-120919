require 'pry'

class MP3Importer
  
  # attr_reader :filepath
  @@paths = []
  
  def initialize(filepath)
    @filepath = filepath
  end
  
  def path
    @filepath
  end
  
  def files
    Dir.entries(@filepath).select { |f| f.end_with?(".mp3") == true }
  end
    
  def import 
    # binding.pry
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
  
end 
