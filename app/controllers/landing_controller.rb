class LandingController < ApplicationController

    def index
      @events = Event.order("created_at desc").limit(6)
      @categories = Category.all
    end
  end
