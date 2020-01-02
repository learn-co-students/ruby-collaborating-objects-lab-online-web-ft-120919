class MP3Importer
  # binding.pry
  attr_accessor :path
  def initialize(path)
    @path = path
    @files = Dir.entries(path).find_all { |e|  e.length > 4}.flatten
    # binding.pry
    @path
  end
  def files
    @files
  end
  def import
    @files.map { |file|Song.new_by_filename(file.split(" - ")[1])  }

  end
end
