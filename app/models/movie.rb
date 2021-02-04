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
  
  def self.with_ratings(ratings_list, sort_by)
    ratings_to_show.clear
    if ratings_list.nil?
      result = Movie.all
    else
      ratings_list_keys = []
      (ratings_list.keys).each do |k|
        ratings_to_show.append(k)
        ratings_list_keys.append(k)
      end
      result = Movie.where({rating: ratings_list_keys})
    end
    if sort_by.nil?
        return result
      else
        return result.order(sort_by)
      end
  end
end
