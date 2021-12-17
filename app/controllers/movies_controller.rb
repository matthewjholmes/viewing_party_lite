class MoviesController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(params[:user_id])
      if (params[:q] == "top_rated")
          @movies = MovieFacade.popular_movies
          @title = "Top Movies"
      else
          @movies = MovieFacade.movie_search(params[:q])
          @title = "Movie Results For: #{params[:q]}"
      end
    else
      handle_restrictions
    end

  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      @movie = MovieFacade.movie_details(params[:id])
      @cast = MovieFacade.cast(params[:id]).take(10)
      @reviews = MovieFacade.reviews(params[:id])
    else
      handle_restrictions
    end

  end
end
