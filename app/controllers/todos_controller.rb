class TodosController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @id = params[:id]
    @todo = Todo.find(@id)
  end

  def create
    new_todo = Todo.create!(todo_text: params[:todo_text],
                            due_date: DateTime.parse(params[:due_date]),
                            completed: false)
    redirect_to todos_path
  end

  def update
    todo = Todo.find(params[:id])
    todo.completed = params[:completed]
    todo.save
    redirect_to todos_path
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end
end
