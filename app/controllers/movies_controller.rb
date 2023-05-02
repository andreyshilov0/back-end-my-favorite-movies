class MovieController < ApplicationController
  
  def index 
    @movies = Movie.all
  end

  def new 
    @movie = Movie.new
  end

  def destroy
    @movie = Movie.destroy
  end

end
