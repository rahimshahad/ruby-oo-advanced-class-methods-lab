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
    song = self.new
    @@all << song
    song
  end
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  def self.find_or_create_by_name(title)
      # if self.find_by_name(title)
      #   self.find_by_name(title)
      # else
      #   self.create_by_name(title)
      # end
      self.find_by_name(title) || self.create_by_name(title)
  end
  def self.alphabetical
    #@@all.sort { |a,b| a.name <=> b.name }
    #the line above is shortened into
    @@all.sort_by { |song| song.name}
  end 
  def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end
  def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end
  def self.destroy_all
    @@all.clear()
  end
end
