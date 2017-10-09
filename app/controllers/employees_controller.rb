class EmployeesController < ApplicationController
  before_action :logged_in_employee

  def index
    @area = Area.find(params[:area_id])
    #@employees = @area.employees.all.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: EmployeeDatatable.new(view_context) }
    end

  end

  def show
    @area = Area.find(params[:area_id])
    @employee = Employee.find(params[:id])
  end

  def new
    @area = Area.find(params[:area_id])
    @employee = Employee.new
    @areas = Area.all.order(:name)
  end

  def edit
    @employee = Employee.find(params[:id])
    @areas = Area.all.order(:name)
  end

  def create
    @area = Area.find(params[:area_id])
    @employee = @area.employees.new(employee_params)
    @employee.password = @employee.staff_id.to_s
    @employee.password_confirmation = @employee.staff_id.to_s
    @areas = Area.all.order(:name)

    if @employee.save
      flash[:success] = "Empleado creado correctamente"
      redirect_to area_employees_path(@area)
    else
      render 'new'
    end
  end

  def update
    @area = Area.find(params[:area_id])
    @employee = @area.employees.find(params[:id])
    @employee.password = @employee.staff_id.to_s
    @employee.password_confirmation = @employee.staff_id.to_s
    @areas = Area.all.order(:name)

    if @employee.update(employee_params)
      flash[:success] = "Empleado actualizado correctamente"
      redirect_to area_employee_path(@area, @employee)
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    unless @employee.destroy
      #flash[:error] = @area.errors.full_messages[0]
      flash[:error] = "No se puede eliminar"
    else
      flash[:success] = "Empleado eliminado correctamente"
    end

    redirect_to area_employees_path

  end

  def directory
    respond_to do |format|
      format.html
      format.json { render json: DirectoryDatatable.new(view_context) }
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :username, :staff_id, :cell_phone, :extension, :email, :area_id, :password, :password_confirmation, :admin)
  end

  # Confirms a logged-in user.
  def logged_in_employee
    unless logged_in?
      flash[:error] = "Por favor inicia sesión."
      redirect_to login_url
    end
  end

end
