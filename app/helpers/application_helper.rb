module ApplicationHelper

  def index?
    controller.action_name == 'index'
  end

  def show?
    controller.action_name == 'show'
  end

  def edit?
    controller.action_name == 'edit'
  end

  def update?
    controller.action_name == 'update'
  end

  def create?
    %w(new create copy).index(controller.action_name)
  end

  def not_create?
    !create?
  end

end
