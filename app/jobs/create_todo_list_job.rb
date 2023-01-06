class CreateTodoListJob < ApplicationJob
  queue_as :default

  def perform(@todos)
    @todos = Category.todos.create(todo_contents)
  end
end
