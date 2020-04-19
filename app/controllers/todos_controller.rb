class TodosController < ApplicationController
  def index
    render plain: "Hello Rails! Here we Go.. BOOM ~_~ #{DateTime.now} \nHello, this is /todos! #{DateTime.now.to_s(:short)}"
  end
end
