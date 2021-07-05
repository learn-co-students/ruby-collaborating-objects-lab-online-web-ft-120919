require 'pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select {|entry| entry.include?(".mp3") }
    end

    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end

end



























# class MP3Importer
#     attr_reader :path
  
#     def initialize(path)
#       @path = path
#     end
  
#     def files
#       @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
#     end
  
#     def import
#       files.each{|f| Song.new_by_filename(f)}
#     end
#   end