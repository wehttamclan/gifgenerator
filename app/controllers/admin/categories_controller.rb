class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    redirect_to new_admin_category_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
