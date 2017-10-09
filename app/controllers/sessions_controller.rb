class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(username: params[:session][:username].downcase)
    if employee && employee.authenticate(params[:session][:password])
      log_in employee
      params[:session][:remember_me] == '1' ? remember(employee) : forget(employee)
      redirect_to employees_directory_path
    else
      flash[:error] = "El nombre de usuario y/o la contraseña son incorrectos"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Has cerrado sesión correctamente"
    redirect_to login_path
  end

end
