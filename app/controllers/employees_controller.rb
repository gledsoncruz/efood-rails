class EmployeesController < ApplicationController
  def index
    @employees = current_user.employees
  end
end
