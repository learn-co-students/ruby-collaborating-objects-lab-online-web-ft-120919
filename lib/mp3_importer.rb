class MP3Importer
  
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    Dir.children(self.path)
  end
  
  def import
    self.files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
  
end