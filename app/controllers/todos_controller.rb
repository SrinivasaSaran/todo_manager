class TodosController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @id = params[:id]
    @todo = current_user.todos.find(@id)
  end

  def create
    new_todo = Todo.create!(todo_text: params[:todo_text],
                            due_date: DateTime.parse(params[:due_date]),
                            completed: false,
                            user_id: current_user.id)
    redirect_to todos_path
  end

  def update
    todo = current_user.todos.find(params[:id])
    todo.completed = params[:completed]
    todo.save
    redirect_to todos_path
  end

  def destroy
    todo = current_user.todos.find(params[:id])
    todo.destroy
    redirect_to todos_path
  end
end
