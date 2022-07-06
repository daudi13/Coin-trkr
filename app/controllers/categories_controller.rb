class CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :set_user
  before_action :set_category, only: %i[show destroy]

  def index
    @categories = @user.categories
  end

  def show
    @transacts = @category.transacts.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = @user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was created successfully.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end