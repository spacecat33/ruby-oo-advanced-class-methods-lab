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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}.uniq
  end

  #or
  # def self.alphabetical() 
  #  @@all.sort_by{|x| x.name}
  # end

  def self.new_from_filename(filename)
    song = self.new  # this test will pass if use self.create with the lasy LOC "song", but not without. Seems incorrect to use self.create as a result?
    file_name = filename.chomp(".mp3").split(" - ")
    song.name = file_name[1]
    song.artist_name = file_name[0]
    song
  end
  

  def self.create_from_filename(filename)
    song = self.create   #or self.new
    file_name = filename.chomp(".mp3").split(" - ")
    song.name = file_name[1]
    song.artist_name = file_name[0]
    # @@all << song    this line is not needed to pass the test because we use self.create within this method. However, if we had used self.new, we would need to add this line to pass the test.
    # song             as above, this line is not needed to pass the test because we use self.create within this method. However, if we had used self.new, we would need to add this line to pass the test.
  end

  def self.destroy_all
    self.all.clear
  end
end
