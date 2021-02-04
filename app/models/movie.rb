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
    end
    #else
     # ratings_list = []
     # (rating.keys).each do |key|
     #   ratings_to_show.append(key)
     #   ratings_list.append(key)
     # end
     # return Movie.where({Rating: ratings_list})
    #end
  end
end
