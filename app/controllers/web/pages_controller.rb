class Web::PagesController < Web::ApplicationController
  def about
    @faculty = Faculty.last
  end

  def contacts
  end
end
