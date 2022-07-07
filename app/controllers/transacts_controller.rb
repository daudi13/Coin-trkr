class TransactsController < ApplicationController
  before_action :set_transact, only: %i[destroy]
  before_action :set_category
  before_action :set_user, only: %i[new]

  def new
    @transact = Transact.new
  end

  def create
    @transact = Transact.new(transact_params)

    respond_to do |format|
      if @transact.save
        format.html { redirect_to category_path(@category), notice: 'Transact was created successfully.' }
        format.json { render :show, status: :created, location: @transact }
      else
        format.html { render :new }
        format.json { render json: @transact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transact.destroy

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'Transact was deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def set_transact
    @transact = Transact.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_user
    @user = current_user
  end
end
