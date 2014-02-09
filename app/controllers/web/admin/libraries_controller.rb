class Web::Admin::LibrariesController < Web::Admin::ApplicationController
  def index
    @libraries = Library.all
  end

  def new
    @library = ::Admin::LibraryEditType.new
  end

  def create
    @library = ::Admin::LibraryEditType.new(params[:library])
    if @library.save
      redirect_to admin_library_path(@library.id)
    else
      render :new
    end
  end

  def edit
    library = Library.find(params[:id])
    @library = library.becomes ::Admin::LibraryEditType
  end

  def update
    library = Library.find(params[:id])
    @library = library.becomes ::Admin::LibraryEditType
    if @library.update(params[:library])
      #      f(:success)
      redirect_to admin_libraries_path
    else
      #      f(:error)
      render :edit
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to admin_libraries_path
  end

  def show
    @library = Library.find(params[:id])
  end
end
