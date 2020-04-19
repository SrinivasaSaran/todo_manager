class Todo < ActiveRecord::Base
  def to_neat_look
    is_complete = completed ? "[X]" : "[ ]"
    "#{id}. Due: #{due_date.to_s(:rfc822)} #{todo_text} #{is_complete}"
  end
end
