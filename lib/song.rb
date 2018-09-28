class Song
  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    self.new(data[1], data[0], data[2])
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap{|obj| obj.save}
  end

  def save
    self.class.all.push(self)
  end

  def artist=(artist)
    @artist = artist
    artist.songs.push(self) unless artist.song.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push(self) unless genre.song.include?(self)
  end


end
