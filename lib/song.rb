# require 'pry'

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

  def self.artist_count
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

  def self.genre_count
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

end
