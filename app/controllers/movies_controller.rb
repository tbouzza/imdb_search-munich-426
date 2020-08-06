class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.syllabus @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      @results = PgSearch.multisearch(params[:query])
                         .group_by(&:searchable_type)
    else
      @movies = Movie.all
    end
  end
end
