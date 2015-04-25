class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.company_id == record.company_id
  end

  def create?
    user.company_id == record.company_id
  end

  def update?
    user.company_id == record.company_id
  end

  def destroy?
    user.company_id == record.company_id
  end

  def permitted_attributes
    %w(company_id email password)
  end

  class Scope < Scope
    def resolve
      scope.where(company_id: user.company_id)
    end
  end
end
