require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @song = Song.new
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }.uniq
  end

  def self.new_from_filename(file_name)
    remove_ext = file_name.split(/\.[^.]+\z/)
    names = remove_ext[0].split(/\W\s/)

    new_song = self.create

    new_song.artist_name = names[0].strip!
    new_song.name = names[1]
    @@all << new_song
   
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all = []
  end
end
