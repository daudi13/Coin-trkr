class splashController < ApplicationController
  def index
    redirect_to categories_url if current_user
  end

end