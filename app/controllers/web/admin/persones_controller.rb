class Web::Admin::PersonesController < Web::Admin::ApplicationController
  def index
    @persones = Persone.all
  end

  def new
    @persone = ::Admin::PersoneEditType.new
  end

  def create
    @persone = ::Admin::PersoneEditType.new(params[:persone])
    if @persone.save
      redirect_to admin_persones_path
    else
      render :new
    end
  end

  def show
    @persone = Persone.find(params[:id])
  end

  def edit
    persone = Persone.find(params[:id])
    @persone = persone.becomes ::Admin::PersoneEditType
  end

  def update
    persone = Persone.find(params[:id])
    @persone = persone.becomes ::Admin::PersoneEditType
    if @persone.update(params[:persone])
      redirect_to admin_persones_path
    else
      render :edit
    end
  end

  def destroy
    persone = Persone.find(params[:id])
    persone.destroy
    redirect_to admin_persones_path
  end
end
