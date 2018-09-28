class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def save
    self.class.all.push(self)
  end

  def add_song(song)
    @songs.push(song) unless @songs.include?(song)
    song.artist = self
  end

  def genres
    Song.all.select{|song| song.artist == self}.collect{|song| song.genre}
  end



end
