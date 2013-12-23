class Web::Admin::CategoriesController < Web::Admin::ApplicationController
  def index
    @categories = Category.scoped
  end

  def new
    @category = ::Admin::CategoryEditType.new
  end

  def create
    @category = ::Admin::CategoryEditType.new(params[:category])
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    category = Category.find(params[:id])
    @category = category.becomes ::Admin::CategoryEditType
  end

  def update
    category = Category.find(params[:id])
    @category = category.becomes ::Admin::CategoryEditType
    if @category.update(params[:category])
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end
end
