class TodosController < ApplicationController
  def index
    @todos = Todo.all.order(created_at: :desc)
    @new_todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    @todo.save
    redirect_to root_path
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.update(completed: !@todo.completed)
    redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
