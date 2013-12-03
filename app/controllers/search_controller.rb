class SearchController < ApplicationController
  def search
    if params[:search].nil? || params[:search].empty?
     @results = []
    else
			@search = Sunspot.search [Medication, User] do 
				fulltext params[:search]
			end
			@results = @search.results
# 	  
# 			respond_to do |format|
# 	      format.json { render json: @results }
# 	    end
    end
  end
end
