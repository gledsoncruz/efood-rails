class PlanPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
