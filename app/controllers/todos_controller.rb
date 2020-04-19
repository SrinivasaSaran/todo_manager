class TodosController < ApplicationController
  def index
    render plain: "Hello Rails! Here we Go.. BOOM ~_~ #{DateTime.now}
    \nHello, this is /todos! #{DateTime.now.to_s(:short)}
    \n\nLets see whats in todos table,\n\n #{Todo.all.to_a}"
  end
end
