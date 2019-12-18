class Album
  attr_reader :id, :name, :year, :genre, :artist ##CHANGE#Our new save method will need reader methods.
  # attr_accessor :name

  @@albums = {}
  # @@sold_albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an ALbum is added.

  def initialize(name, id, year, genre, artist) ##CHANGE # We've added id as a second parameter.
    @name = name
    @id = id || @@total_rows += 1  # We've added code to handle the id.
    @year = year
    @genre = genre
    @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def self.search(x)
    @@albums.values().select {|e| /#{x}/i.match? e.name}
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, "", "", "") #CHANGE
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, year, genre, artist) #CHANGE
    @name = (name != '') ? name : @name
    @year = (year != '') ? year : @year
    @genre = (genre != '') ? genre : @genre
    @artist = (artist != '') ? artist : @artist
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.sort()
    @@albums.values().sort { |a, b| a.name <=> b.name }
    # @@albums.values()
  end

  def songs
    Song.find_by_album(self.id)
  end

  # def sold()
  #   @@sold_albums[self.id].push(@@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist))
  #   @@albums.delete(self.id)
  #   # @@albums.values()
  # end


end
