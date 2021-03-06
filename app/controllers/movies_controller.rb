class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    if params.has_key?(:ratings)
      @ratings_list = params[:ratings]
    else
      @ratings_list = nil
    #else
     # if !@ratings_to_show.nil?
     #   @ratings_to_show.each do |rating|
     #     @ratings_list[rating] = "1"
     #   end
     # end
    end
    session[:ratings_list] = @ratings_list
    @ratings_to_show = Movie.ratings_to_show
    if params.has_key?(:sort_by)
      @sort_by = params[:sort_by]
    else
      @sort_by = ''
    end
    session[:sort_by] = @sort_by
    @movies = Movie.with_ratings(@ratings_list, @sort_by)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
