class Movie < ActiveRecord::Base
  @@all_ratings = ['G','PG','PG-13','R']
  @ratings_to_show = []
  
  def self.all_ratings
    @@all_ratings
  end
  
  def self.ratings_to_show
    @ratings_to_show
  end
  
  def self.ratings_to_show=(ratings_to_show)
    @ratings_to_show = ratings_to_show
  end
end
