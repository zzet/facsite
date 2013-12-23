class Web::Admin::DocumentsController < Web::Admin::ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = ::Admin::DocumentEditType.new
  end

  def create
    @document = ::Admin::DocumentEditType.new(params[:document])
    if @document.save
      redirect_to admin_documents_path
    else
      render :new
    end
  end

  def edit
    document = Document.find(params[:id])
    @document = document.becomes ::Admin::DocumentEditType
  end

  def update
    document = Document.find(params[:id])
    @document = document.becomes ::Admin::DocumentEditType
    if @document.update(params[:document])
      redirect_to admin_documents_path
    else
      render :edit
    end
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy
    redirect_to admin_documents_path
  end
end
