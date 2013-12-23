class Web::Admin::FacultiesController < Web::Admin::ApplicationController
  def show
    @faculty = Faculty.last
    redirect_to new_admin_faculties_path if @faculty.nil?
  end

  def edit
    faculty = Faculty.last
    @faculty = faculty.becomes ::Admin::FacultyEditType
  end

  def update
    faculty = Faculty.last
    @faculty = faculty.becomes ::Admin::FacultyEditType
    if @faculty.update(params[:faculty])
      redirect_to admin_faculties_path
    else
      render :edit
    end
  end

  def create
    @faculty = ::Admin::FacultyEditType.new(params[:faculty])
    if @faculty.save
      redirect_to admin_faculties_path
    else
      render :new
    end
  end

  def new
    @faculty = ::Admin::FacultyEditType.new
  end
end
