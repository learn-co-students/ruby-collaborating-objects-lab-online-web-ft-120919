# The MP3Importer class will parse all the filenames in 
# the spec/fixtures folder and send the filenames to the 
# Song class

class MP3Importer
    attr_accessor :path
  
    def initialize(path)
      @path = path
    end
  
    def files
    #   files = []
    #   Dir.new(self.path).each do |file|
    #     files << file if file.length > 4
    #   end
    #   files
        Dir.entries(path).select {|entry| entry.include?(".mp3")}
    end
  
    def import
      self.files.each do |filename|
        Song.new_by_filename(filename)
      end
    end
  end