class CategoriesController < ApplicationController

  def index
    @events = Event.search(search_params, page: params[:page], per_page: 15)
  end

  def show
    @events = Event.where(category_id: params[:id]).page params[:page]
  end

  private

   def search_params
     params.dig(:search) || "*"
   end
end
