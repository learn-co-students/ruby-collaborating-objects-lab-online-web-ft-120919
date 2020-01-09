# frozen_string_literal: true

# MP3 importing
class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.entries(path).select { |entry| entry.include?('.mp3')}
  end

  def import
    self.files.each { |file| Song.new_by_filename(file) }
  end
end

