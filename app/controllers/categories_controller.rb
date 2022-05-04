class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = Category.where(user_id: @user.id)
  end

  def new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
        flash.notice = 'Category was successfully created.'
        redirect_to user_categories_path(@category.current_user)
      else
        flash.alert = 'Category was not created.'
        render :new
      end
  end

  def show; end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
