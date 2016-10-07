class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @events = Event.search(search_params, page: params[:page], per_page: 15)
  end

  def show
    @events = Event.where(category_id: params[:id]).page params[:page]
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  private

   def search_params
     params.dig(:search) || "*"
   end
end
