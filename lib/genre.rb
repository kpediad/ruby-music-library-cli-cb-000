class Genre
  extend Concerns::Findable

  @@all = []
  attr_accessor :name

  def initialize(name)
    self.name = name
    @songs = []
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

  def artists
    Song.all.select{|song| song.genre == self}.collect{|song| song.artist}
  end


end
