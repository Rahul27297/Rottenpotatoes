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
  
  def self.with_ratings(ratings_list)
    ratings_to_show.clear
    if ratings_list.nil?
      return Movie.all
    else
      ratings_list_keys = []
      (ratings_list.keys).each do |k|
        ratings_to_show.append(k)
        ratings_list_keys.append(k)
      end
      return Movie.all
    end
  end
end
