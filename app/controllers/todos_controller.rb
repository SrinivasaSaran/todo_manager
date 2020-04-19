class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "Hello Rails! Here we Go.. BOOM ~_~ #{DateTime.now}
    \nHello, this is /todos! #{DateTime.now.to_s(:short)}
    \n\nLets see whats in todos table,\n\n #{Todo.all.to_a}
    \n\nTo neat looking text,
    \n#{Todo.all.map { |todo| todo.to_neat_look }.join("\n")}
    \n\nDate-wise ordered todo,
    \n#{Todo.order(:due_date).map { |todo| todo.to_neat_look }.join("\n")}"
  end

  def show
    id = params[:id]
    render plain: "Todo id you are looking for is #{params[:id]}
    \n#{Todo.find(id).to_neat_look}"
  end

  def create
    new_todo = Todo.create!(todo_text: params[:todo_text],
                            due_date: DateTime.parse(params[:due_date]),
                            completed: false)
    response_text = "New todo is created. Its id is #{new_todo.id}"
    render plain: "#{params}\n\n#{response_text}"
  end
end
