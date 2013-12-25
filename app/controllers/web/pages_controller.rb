class Web::PagesController < Web::ApplicationController
  def about
    @faculty = Faculty.last
    @persones = Persone.all
  end

  def contacts
  end
end
