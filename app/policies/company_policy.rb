class CompanyPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.company_id == record.id
  end

  class Scope < Scope
    def resolve
      scope.where(id: user.company_id)
    end
  end
end
