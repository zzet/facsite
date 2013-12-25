class Web::PersonesController < Web::ApplicationController
  def index
    @persones = Persone.web
  end

  def show
    @persone = Persone.find(params[:id])
  end
end
