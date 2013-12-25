class Web::CategoriesController < Web::ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category   = Category.find_by(slug: params[:id])
    @news       = @category.news
    @events     = @category.events
    @documents  = @category.documents
  end
end
