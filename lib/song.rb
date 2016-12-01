class Song
  attr_accessor :name, :artist_name, :filename

  @@all = []

  def initialize (name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new
  end

  def self.new_by_name (name)
    song = Song.new(name)
  end

  def self.create_by_name (name)
    Song.new(name)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename (filename)
    artist_name, name = filename.gsub(".mp3", ""). split(" - ")
    Song.new(name, artist_name)
  end
  def self.create_from_filename (filename)
    artist_name, name = filename.gsub(".mp3", ""). split(" - ")
    Song.new(name, artist_name)
  end


end
