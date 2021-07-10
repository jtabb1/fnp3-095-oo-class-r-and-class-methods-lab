# Added the official solution as an alternative to the 
# originally written working solution shown below:
#
# More test have to be done to find out which solution 
# is faster for large and continuously updated libraries
# of songs.
#

class Song

  @@count = 0
  @@artists = []
  @@genres = []

  attr_accessor :name, :artist, :genre

  def initialize(name,artist,genre)
    @name = name
    @artist = artist
    @genre = genre

    @@artists << artist
    @@genres << genre
    @@count += 1
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end  

  def self.artist_count_0
    artists = @@artists.sort!
    ct = 0
    key = artists[0]
    Hash[ artists.collect do |et|
      if et != key
        key, ct = et, 1
      else
        ct += 1
      end
      [key, ct]
    end ]
  end

  def self.count
    @@count
  end

  def self.genre_count_0
    genres = @@genres.sort!
    ct = 0
    key = genres[0]
    Hash[ genres.collect do |et|
      if et != key
        key, ct = et, 1
      else
        ct += 1
      end
      [key, ct]
    end ]
  end

  def self.artist_count
    artist_count = {}
    @@artists.each do |artist|
      if artist_count[artist]
        artist_count[artist] += 1 
      else
        artist_count[artist] = 1
      end
    end
    artist_count
  end

  def self.genre_count
    genre_count = {}
    @@genres.each do |genre|
      if genre_count[genre]
        genre_count[genre] += 1 
      else
        genre_count[genre] = 1
      end
    end
    genre_count
  end
  
end
