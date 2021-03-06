module SessionsHelper

  def log_in(employee)
    session[:employee_id] = employee.id
  end

  # Remembers a user in a persistent session.
  def remember(employee)
    employee.remember
    cookies.permanent.signed[:employee_id] = employee.id
    cookies.permanent[:remember_token] = employee.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_employee
    # @current_employee ||= Employee.find_by(id: session[:employee_id])
    if (employee_id = session[:employee_id])
      @current_employee ||= Employee.find_by(id: employee_id)
    elsif (employee_id = cookies.signed[:employee_id])
      employee = Employee.find_by(id: employee_id)
      if employee && employee.authenticated?(cookies[:remember_token])
        log_in employee
        @current_user = employee
      end
    end
  end

  #Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_employee.nil?
  end

  # Forgets a persistent session.
  def forget(employee)
    employee.forget
    cookies.delete(:employee_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_employee)
    session.delete(:employee_id)
    @current_employee = nil
  end

end
