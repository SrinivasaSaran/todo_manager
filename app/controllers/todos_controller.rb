class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
  end

  def show
    id = params[:id]
    render "show"
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
end
