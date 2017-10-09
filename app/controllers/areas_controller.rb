class AreasController < ApplicationController
  before_action :logged_in_employee

  def index
    respond_to do |format|
      format.html
      format.json { render json: AreaDatatable.new(view_context) }
    end
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def edit
    @area = Area.find(params[:id])
  end

  def create
    @area = Area.new(area_params)

    if @area.save
      flash[:success] = "Área creada correctamente"
      #redirect_to @area
      redirect_to areas_path
    else
      render 'new'
    end
  end

  def update
    @area = Area.find(params[:id])

    if @area.update(area_params)
      flash[:success] = "Área editada correctamente"
      redirect_to @area
    else
      render 'edit'
    end
  end

  def destroy
    @area = Area.find(params[:id])
    unless @area.destroy
      #flash[:error] = @area.errors.full_messages[0]
      flash[:error] = "No se puede eliminar porque existen registros de empleados bajo esta área"
    else
      flash[:success] = "Área eliminada correctamente"
    end
    redirect_to areas_path
  end

  private
  def area_params
    params.require(:area).permit(:name, :cost_center)
  end

  # Confirms a logged-in user.
  def logged_in_employee
    unless logged_in? && current_employee.admin?
      flash[:error] = "Por favor inicia sesión como administrador."
      redirect_to employees_directory_path
    end
  end

end
