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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
   song = self.create
   song.name = name
   song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.find do |song| 
      song.name==name 
      end
    end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.gsub(".mp3","").split(/ - /)
    song = self.create_by_name(array[1])
    song.artist_name = array[0]
    song
    
    # binding.pry
    
  end

  def self.create_from_filename(filename)
      self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
# binding.pry
0