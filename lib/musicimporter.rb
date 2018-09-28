class MusicImporter

  def self.import
    self.files.each{|filename| Song.create_from_filename(filename)}
  end

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path + "/**/*"]
  end

end
