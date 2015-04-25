class AliasPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.company.user_ids.include? record.user_id
  end

  def create?
    user.company.user_ids.include? record.user_id
  end

  def update?
    user.company.user_ids.include? record.user_id
  end

  def destroy?
    user.company.user_ids.include? record.user_id
  end

  def permitted_attributes
    %w(user_id source)
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.company.user_ids)
    end
  end
end
